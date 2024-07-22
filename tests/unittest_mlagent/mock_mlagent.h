/**
 * SPDX-License-Identifier: LGPL-2.1-only
 *
 * @file        mlagent_mock.h
 * @date        29 Nov 2023
 * @brief       Mocking ML Agent APIs
 * @see         https://github.com/nnstreamer/nnstreamer
 * @author      Wook Song <wook.song16@samsung.com>
 * @bug         No known bugs
 */
#ifndef __NNS_MLAGENT_MOCK_H__
#define __NNS_MLAGENT_MOCK_H__

#include <glib.h>

#include <unordered_map>
#include <vector>
#include <utility>

struct MockModel;

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/**
 * @brief Initialize the static unique_ptr of MockMLAgent
 */
void ml_agent_mock_init ();

/**
 * @brief C-wrapper for the MockModel's method model_add.
 * @param[in] name The model's name to add
 * @param[in] path The model's name to add
 * @param[in] app_info The model's name to add
 * @param[in] is_activated The model's name to add
 * @param[in] desc The model's version to add
 * @param[in] version The JSON c-string containing the information of the model matching to the given name and version
 * @return true if there is a matching model to the given name and version, otherwise a negative integer
 * @note ML Agent provides the original implementation of this function and
 * the following implementation is only for testing purposes.
 */
bool ml_agent_mock_model_add (const gchar *name, const gchar *path, const gchar *info,
    const bool is_activated, const char *desc, const guint version);

/**
 * @brief C-wrapper for the MockModel's method model_get.
 * @param[in] name The model's name to retrieve
 * @param[in] version The model's version to retrieve
 * @return A pointer to the model matching the given information. If there is no model possible, NULL is returned.
 */
MockModel *ml_agent_mock_model_get (const gchar *name, const guint version);

/**
 * @brief C-wrapper for the MockModel's method model_get_activated.
 * @param[in] name The model's name to retrieve
 * @return A pointer to the model matching the given information. If there is no model possible, NULL is returned.
 */
MockModel *ml_agent_mock_model_get_activated (const gchar *name);

/**
 * @brief Pass the JSON c-string generated by the ML Agent mock class to the caller.
 * @param[in] name The model's name to retrieve
 * @param[in] version The model's version to retrieve
 * @param[out] description The JSON c-string, containing the information of the model matching the given name and version
 * @return 0 if there is a matching model to the given name and version otherwise a negative integer
 * @note ML Agent provides the original implementation of this function and
 * the following implementation is only for testing purposes.
 */
gint ml_agent_model_get (
    const gchar *name, const guint version, gchar **description);

/**
 * @brief Pass the JSON c-string generated by the ML Agent mock class to the caller.
 * @param[in] name The model's name to retrieve
 * @param[out] description The JSON c-string, containing the information of the activated model matching the given name
 * @return 0 if there is a matching model to the given name and version otherwise a negative integer
 * @note ML Agent provides the original implementation of this function and
 * the following implementation is only for testing purposes.
 */
gint ml_agent_model_get_activated (
    const gchar *name, gchar **description);
#ifdef __cplusplus
}
#endif /* __cplusplus */

/**
 * @brief Class for mock Model object
 */
struct MockModel {
  /* Constructors */
  MockModel () = delete;
  MockModel (std::string name, std::string path = {}, std::string app_info = {},
      bool is_activated = false, std::string desc = {}, guint version = 0U)
      : name_{ name }, path_{ path }, app_info_{ app_info },
        is_activated_{ is_activated }, desc_{ desc }, version_{ version } {

        };
  /* Copy constructor */
  MockModel (const MockModel &other)
      : MockModel (other.name_, other.path_, other.app_info_,
          other.is_activated_, other.desc_, other.version_){

        };
  /* Move constructor */
  MockModel (MockModel &&other) noexcept
  {
    *this = std::move (other);
  }
  MockModel &operator= (const MockModel &other) = delete;
  MockModel &operator= (MockModel &&other) noexcept
  {
    if (this == &other)
      return *this;

    this->name_ = std::move (other.name_);
    this->path_ = std::move (other.path_);
    this->app_info_ = std::move (other.app_info_);
    this->is_activated_ = std::exchange (other.is_activated_, false);
    this->desc_ = std::move (other.desc_);
    this->version_ = std::exchange (other.version_, 0U);

    return *this;
  }

  bool operator== (const MockModel &model) const
  {
    if (name_ == model.name_ && version_ == model.version_)
      return true;
    return false;
  }

  /* Getters */
  std::string name () const
  {
    return name_;
  }

  std::string path () const
  {
    return path_;
  }
  std::string app_info () const
  {
    return app_info_;
  }
  bool is_activated () const
  {
    return is_activated_;
  }

  std::string desc () const
  {
    return desc_;
  }

  guint version () const
  {
    return version_;
  }

  /* Setters */
  void path (const std::string &path)
  {
    path_ = path;
  }

  void is_activated (bool flag)
  {
    is_activated_ = flag;
  }

  void desc (const std::string &description)
  {
    desc_ = description;
  }

  void app_info (const std::string &info)
  {
    app_info_ = info;
  }

  void version (guint ver)
  {
    version_ = ver;
  }

  /**
   * @brief Generate C-stringified JSON
   * @return C-stringified JSON
   */
  gchar *to_cstr_json ();

  private:
  std::string name_;
  std::string path_{};
  std::string app_info_{};
  bool is_activated_{ false };
  std::string desc_{};
  guint version_{ 0U };
};

/**
 * @brief Class for mock MLAgent object
 */
struct MockMLAgent {
  MockMLAgent ()
  {
  }

  /**
   * @brief Add mock model to model repo.
   */
  bool model_add (MockModel model)
  {
    std::string key = model.name ();

    {
      auto range = models_dict_.equal_range (key);

      for (auto it = range.first; it != range.second; ++it) {
        if (model == it->second)
          return false;
      }
    }

    models_dict_.insert (std::make_pair (key, model));

    return true;
  }

  /**
   * @brief Get mock model from model repo.
   */
  MockModel *model_get (const gchar *name, guint version)
  {
    std::string key{ name };
    auto range = models_dict_.equal_range (key);

    for (auto it = range.first; it != range.second; ++it) {
      if (version == it->second.version ())
        return &it->second;
    }

    return nullptr;
  }

  /**
   * @brief Get activated mock model from model repo.
   */
  MockModel *model_get_activated (const gchar *name)
  {
    std::string key{ name };
    auto range = models_dict_.equal_range (key);

    for (auto it = range.first; it != range.second; ++it) {
      if (true == it->second.is_activated ())
        return &it->second;
    }

    return nullptr;
  }

  private:
  std::unordered_multimap<std::string, MockModel> models_dict_;
};

#endif /* __NNS_MLAGENT_MOCK_H__ */
