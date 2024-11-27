#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <string.h>
#include <nnstreamer_util.h>
#include "gsttensor_generator.h"

GST_DEBUG_CATEGORY_STATIC (gst_tensor_generator_debug);
#define GST_CAT_DEFAULT gst_tensor_generator_debug

/**
 * @brief Template for sink pad.
 */
static GstStaticPadTemplate sink_template = GST_STATIC_PAD_TEMPLATE ("sink",
    GST_PAD_SINK,
    GST_PAD_ALWAYS,
    GST_STATIC_CAPS (GST_TENSOR_CAP_DEFAULT ";"
        GST_TENSORS_CAP_MAKE ("{ static, flexible }")));

/**
 * @brief Template for src pad.
 */
static GstStaticPadTemplate src_template = GST_STATIC_PAD_TEMPLATE ("src",
    GST_PAD_SRC,
    GST_PAD_ALWAYS,
    GST_STATIC_CAPS (GST_TENSORS_FLEX_CAP_DEFAULT));

/** FIXME: Define caps for signal*/
static GstStaticPadTemplate sink_signal_template = GST_STATIC_PAD_TEMPLATE ("sink_signal",
    GST_PAD_SINK,
    GST_PAD_ALWAYS,
    GST_STATIC_CAPS("signals, framerate = (fraction) [ 0, max ]"));

static GstStaticPadTemplate src_signal_template = GST_STATIC_PAD_TEMPLATE ("src_signal",
    GST_PAD_SRC,
    GST_PAD_ALWAYS,
    GST_STATIC_CAPS("signals, framerate = (fraction) [ 0, max ]"));

#define gst_tensor_generator_parent_class parent_class
G_DEFINE_TYPE (GstTensorGenerator, gst_tensor_generator, GST_TYPE_ELEMENT);

static void gst_tensor_generator_finalize (GObject * object);
static void gst_tensor_generator_set_property (GObject * object, guint prop_id,
    const GValue * value, GParamSpec * pspec);
static void gst_tensor_generator_get_property (GObject * object, guint prop_id,
    GValue * value, GParamSpec * pspec);
static GstStateChangeReturn gst_tensor_generator_change_state (GstElement * element,
    GstStateChange transition);
static gboolean gst_tensor_generator_src_event (GstPad * pad, GstObject * parent,
    GstEvent * event);
static gboolean gst_tensor_generator_sink_event (GstCollectPads * pads, GstCollectData * data,
    GstEvent * event, gpointer user_data);
static GstFlowReturn gst_tensor_generator_collected (GstCollectPads * pads,
    gpointer user_data);
static gboolean gst_generator_signal_query (GstPad * pad, GstObject * parent, GstQuery * query);

/**
 * @brief Initialize the tensor_generator's class.
 */
static void
gst_tensor_generator_class_init (GstTensorGeneratorClass * klass)
{
  GObjectClass *object_class;
  GstElementClass *element_class;

  GST_DEBUG_CATEGORY_INIT (gst_tensor_generator_debug, "tensor_generator", 0,
      "Element to generator the tensors");

  object_class = (GObjectClass *) klass;
  element_class = (GstElementClass *) klass;

  object_class->set_property = gst_tensor_generator_set_property;
  object_class->get_property = gst_tensor_generator_get_property;
  object_class->finalize = gst_tensor_generator_finalize;

  element_class->change_state =
      GST_DEBUG_FUNCPTR (gst_tensor_generator_change_state);

  gst_element_class_add_pad_template (element_class,
      gst_static_pad_template_get (&src_template));
  gst_element_class_add_pad_template (element_class,
      gst_static_pad_template_get (&sink_template));

  gst_element_class_set_static_metadata (element_class,
      "Tensor Generator",
      "Filter/Generator",
      "Element to generator the tensors",
      "Samsung Electronics Co., Ltd.");
}

/**
 * @brief Initialize tensor_generator element.
 */
static void
gst_tensor_generator_init (GstTensorGenerator * self)
{
  GstCaps *caps;
  GstPadLinkReturn ret;

  /* setup sink pad */
  self->sinkpad = gst_pad_new_from_static_template (&sink_template, "sink_tensor");
  gst_element_add_pad (GST_ELEMENT (self), self->sinkpad);

  self->sinkpad_signal = gst_pad_new_from_static_template (&sink_signal_template, "sink_signal");
  gst_pad_set_active (self->sinkpad_signal, TRUE);

  self->collect = gst_collect_pads_new ();
  gst_collect_pads_set_function (self->collect,
      GST_DEBUG_FUNCPTR (gst_tensor_generator_collected), self);
  gst_collect_pads_set_event_function (self->collect,
      GST_DEBUG_FUNCPTR (gst_tensor_generator_sink_event), self);

  gst_collect_pads_add_pad (self->collect, self->sinkpad,
      sizeof (GstTensorCollectPadData), NULL, TRUE);
  gst_collect_pads_add_pad (self->collect, self->sinkpad_signal,
      sizeof (GstTensorCollectPadData), NULL, TRUE);

  /* setup src pad */
  self->srcpad = gst_pad_new_from_static_template (&src_template, "src_tensor");
  gst_pad_set_event_function (self->srcpad,
      GST_DEBUG_FUNCPTR (gst_tensor_generator_src_event));
  gst_element_add_pad (GST_ELEMENT (self), self->srcpad);

  self->srcpad_signal = gst_pad_new_from_static_template (&src_signal_template, "src_signal");
  gst_pad_set_active (self->srcpad_signal, TRUE);

  gst_pad_set_event_function (self->srcpad_signal,
      GST_DEBUG_FUNCPTR (gst_tensor_generator_src_event));
  gst_pad_set_query_function (self->srcpad_signal, GST_DEBUG_FUNCPTR (gst_generator_signal_query));
  gst_pad_set_query_function (self->sinkpad_signal, GST_DEBUG_FUNCPTR (gst_generator_signal_query));

  gst_tensors_config_init (&self->in_config);

  caps = gst_caps_new_simple ("signals", "framerate", GST_TYPE_FRACTION, self->in_config.rate_n, self->in_config.rate_d, NULL);
  gst_pad_set_caps(self->srcpad_signal, caps);
  gst_pad_set_caps(self->sinkpad_signal, caps);
  gst_caps_unref (caps);

  ret = gst_pad_link (self->srcpad_signal, self->sinkpad_signal);
  if (GST_PAD_LINK_FAILED(ret))
    ml_loge("Failed to link the signal src and sink pads");

  self->thread = NULL;
  self->running = FALSE;
}

/**
 * @brief Function to finalize instance.
 */
static void
gst_tensor_generator_finalize (GObject * object)
{
  G_OBJECT_CLASS (parent_class)->finalize (object);
}

/**
 * @brief Setter for tensor_generator properties.
 */
static void
gst_tensor_generator_set_property (GObject * object, guint prop_id,
    const GValue * value, GParamSpec * pspec)
{
  UNUSED (value);
  switch (prop_id) {
    default:
      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
      break;
  }
}

/**
 * @brief Getter for tensor_generator properties.
 */
static void
gst_tensor_generator_get_property (GObject * object, guint prop_id,
    GValue * value, GParamSpec * pspec)
{
  UNUSED (value);
  switch (prop_id) {
    default:
      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
      break;
  }
}

/**
 * @brief Handle state transition.
 */
static GstStateChangeReturn
gst_tensor_generator_change_state (GstElement * element, GstStateChange transition)
{
  GstTensorGenerator *self;
  GstStateChangeReturn ret;

  self = GST_TENSOR_GENERATOR (element);

  switch (transition) {
    case GST_STATE_CHANGE_READY_TO_PAUSED:
      gst_collect_pads_start (self->collect);
      break;
    case GST_STATE_CHANGE_PAUSED_TO_READY:
      gst_collect_pads_stop (self->collect);
      break;
    default:
      break;
  }

  ret = GST_ELEMENT_CLASS (parent_class)->change_state (element, transition);

  return ret;
}

static gboolean
gst_generator_signal_query (GstPad * pad, GstObject * parent, GstQuery * query)
{
  gboolean res = FALSE;
  GstCaps *caps;

  switch (GST_QUERY_TYPE (query)) {
    case GST_QUERY_CAPS:
      caps = gst_caps_new_simple ("signals", "framerate", GST_TYPE_FRACTION, 0, 1, NULL);
      gst_query_set_caps_result (query, caps);
      gst_caps_unref (caps);
      return TRUE;
    case GST_QUERY_ACCEPT_CAPS:
      gst_query_set_accept_caps_result (query, TRUE);
      return TRUE;
    default:
      res = gst_pad_query_default (pad, parent, query);
      break;
  }

  return res;
}

/**
 * @brief Handle event on src pad.
 */
static gboolean
gst_tensor_generator_src_event (GstPad * pad, GstObject * parent, GstEvent * event)
{
  g_return_val_if_fail (event != NULL, FALSE);

  switch (GST_EVENT_TYPE (event)) {
    case GST_EVENT_SEEK:
      /* disable seeking */
      gst_event_unref (event);
      return FALSE;
    default:
      break;
  }

  return gst_pad_event_default (pad, parent, event);
}

static gpointer
tensor_generator_signal_activate (GstTensorGenerator *self)
{
  GstBuffer *dummy;
  GstMemory *mem;
  guint8 *data;

  dummy = gst_buffer_new ();
  data = (guint8 *) g_malloc0 (1);
  mem = gst_memory_new_wrapped (0, data, 1, 0 ,1, data, g_free);
  gst_buffer_append_memory (dummy, mem);

  gst_pad_push (self->srcpad_signal, dummy);
  gst_pad_push_event (self->srcpad_signal, gst_event_new_eos ());
  return NULL;
}

static gboolean
gst_tensor_generator_sink_signal_event(GstTensorGenerator *self, GstCollectPads * pads, GstCollectData * data,
    GstEvent * event)
{
  UNUSED(self);

  switch (GST_EVENT_TYPE (event)) {
    case GST_EVENT_CAPS:
      return TRUE;
    case GST_EVENT_SEEK:
      /* disable seeking */
      gst_event_unref (event);
    return FALSE;
    default:
      break;
  }

  return gst_collect_pads_event_default (pads, data, event, FALSE);
}

static gboolean
gst_tensor_generator_sink_tensor_event(GstTensorGenerator *self, GstCollectPads * pads, GstCollectData * data,
    GstEvent * event)
{
  GstCaps *caps;
  GstStructure *structure;

  switch (GST_EVENT_TYPE (event)) {
      case GST_EVENT_CAPS:
        gst_event_parse_caps (event, &caps);
        structure = gst_caps_get_structure (caps, 0);
        gst_tensors_config_from_structure (&self->in_config, structure);
        gst_event_unref (event);
        return TRUE;
      case GST_EVENT_STREAM_START:
        if (!self->running) {
          self->thread =
            g_thread_new ("signal_activate_function",(GThreadFunc) tensor_generator_signal_activate, self);
          if (!self->thread) {
            ml_loge("Failed to create thread");
          }
          self->running = TRUE;
        }
        return TRUE;
      case GST_EVENT_SEEK:
        /* disable seeking */
        gst_event_unref (event);
        return FALSE;
      default:
        break;
    }

  return gst_collect_pads_event_default (pads, data, event, FALSE);
}

static gboolean
gst_tensor_generator_sink_event (GstCollectPads * pads, GstCollectData * data,
    GstEvent * event, gpointer user_data)
{
  GstTensorGenerator *self;
  g_return_val_if_fail (event != NULL, FALSE);

  self = GST_TENSOR_GENERATOR (user_data);
  if (data->pad==self->sinkpad) {
    return gst_tensor_generator_sink_tensor_event (self, pads, data, event);
  } else if (data->pad==self->sinkpad_signal) {
    return gst_tensor_generator_sink_signal_event (self, pads, data, event);
  }

  return FALSE;
}

static GstFlowReturn
gst_tensor_generator_chain (GstTensorGenerator *self, GstCollectData * data)
{
  GstFlowReturn ret;
  GstBuffer *result;

  /* TODO : Create tensors from tensor_filter */
  result = gst_collect_pads_peek (self->collect, data);
  result = gst_tensor_buffer_from_config (result, &self->in_config);

  ret = gst_pad_push (self->srcpad, result);

  return ret;
}

/** FIXME: Temporary variable */
static int count = 0;

static GstFlowReturn
gst_tensor_generator_collected (GstCollectPads * pads,
    gpointer user_data)
{
  GstTensorGenerator *self;
  GstCollectData *data_raw;
  GstCollectData *data_signal;
  GSList *walk;

  self = GST_TENSOR_GENERATOR (user_data);

  if (!gst_pad_has_current_caps (self->srcpad)) {
    GstTensorsConfig config;
    GstCaps *caps;

    gst_tensors_config_init (&config);

    /* output tensor is always flexible */
    config.info.format = _NNS_TENSOR_FORMAT_FLEXIBLE;
    config.rate_d = self->in_config.rate_d;
    config.rate_n = self->in_config.rate_n;
    caps = gst_tensors_caps_from_config (&config);
    gst_pad_set_caps (self->srcpad, caps);
    gst_caps_unref (caps);
  }

  for (walk = pads->data; walk; walk = g_slist_next (walk)) {
    GstCollectData *data;

    data = (GstCollectData *) walk->data;

    if (GST_COLLECT_PADS_STATE_IS_SET (data, GST_COLLECT_PADS_STATE_EOS)) {
      gst_pad_push_event (self->srcpad, gst_event_new_eos ());
      return GST_FLOW_EOS;
    }

    if (data->pad == self->sinkpad)
      data_raw = data;
    if (data->pad == self->sinkpad_signal)
      data_signal = data;

    /** FIXME: Temporary condition to stop generating tensors */
    if (count >= 10)
      self->running = FALSE;
    else count++;
  }

  if (!self->running)
    gst_buffer_unref (gst_collect_pads_pop (self->collect, data_signal));

  return gst_tensor_generator_chain (self, data_raw);
}
