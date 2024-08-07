

deploy_netr
data
conv1_wconv1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
conv1
comp_0_spatbn_0_s
comp_0_spatbn_0_b
comp_0_spatbn_0_rm
comp_0_spatbn_0_rivcomp_0_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_0_spatbn_0comp_0_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_0_spatbn_0
comp_0_conv_1_wcomp_0_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_0_conv_1
comp_0_spatbn_1_s
comp_0_spatbn_1_b
comp_0_spatbn_1_rm
comp_0_spatbn_1_rivcomp_0_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_0_spatbn_1comp_0_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_0_spatbn_1
comp_0_conv_2_wcomp_0_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNl
conv1
comp_0_conv_2comp_0_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_0_sum_2
comp_1_spatbn_0_s
comp_1_spatbn_0_b
comp_1_spatbn_0_rm
comp_1_spatbn_0_rivcomp_1_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_1_spatbn_0comp_1_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_1_spatbn_0
comp_1_conv_1_wcomp_1_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_1_conv_1
comp_1_spatbn_1_s
comp_1_spatbn_1_b
comp_1_spatbn_1_rm
comp_1_spatbn_1_rivcomp_1_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_1_spatbn_1comp_1_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_1_spatbn_1
comp_1_conv_2_wcomp_1_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNs
comp_0_sum_2
comp_1_conv_2comp_1_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_1_sum_2
comp_2_spatbn_0_s
comp_2_spatbn_0_b
comp_2_spatbn_0_rm
comp_2_spatbn_0_rivcomp_2_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_2_spatbn_0comp_2_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_2_spatbn_0
comp_2_conv_1_wcomp_2_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_2_conv_1
comp_2_spatbn_1_s
comp_2_spatbn_1_b
comp_2_spatbn_1_rm
comp_2_spatbn_1_rivcomp_2_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_2_spatbn_1comp_2_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_2_spatbn_1
comp_2_conv_2_wcomp_2_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNs
comp_1_sum_2
comp_2_conv_2comp_2_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_2_sum_2
comp_3_spatbn_0_s
comp_3_spatbn_0_b
comp_3_spatbn_0_rm
comp_3_spatbn_0_rivcomp_3_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_3_spatbn_0comp_3_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_3_spatbn_0
comp_3_conv_1_wcomp_3_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_3_conv_1
comp_3_spatbn_1_s
comp_3_spatbn_1_b
comp_3_spatbn_1_rm
comp_3_spatbn_1_rivcomp_3_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_3_spatbn_1comp_3_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_3_spatbn_1
comp_3_conv_2_wcomp_3_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNs
comp_2_sum_2
comp_3_conv_2comp_3_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_3_sum_2
comp_4_spatbn_0_s
comp_4_spatbn_0_b
comp_4_spatbn_0_rm
comp_4_spatbn_0_rivcomp_4_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_4_spatbn_0comp_4_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_4_spatbn_0
comp_4_conv_1_wcomp_4_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_4_conv_1
comp_4_spatbn_1_s
comp_4_spatbn_1_b
comp_4_spatbn_1_rm
comp_4_spatbn_1_rivcomp_4_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_4_spatbn_1comp_4_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_4_spatbn_1
comp_4_conv_2_wcomp_4_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNs
comp_3_sum_2
comp_4_conv_2comp_4_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_4_sum_2
comp_5_spatbn_0_s
comp_5_spatbn_0_b
comp_5_spatbn_0_rm
comp_5_spatbn_0_rivcomp_5_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_5_spatbn_0comp_5_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_5_spatbn_0
comp_5_conv_1_wcomp_5_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_5_conv_1
comp_5_spatbn_1_s
comp_5_spatbn_1_b
comp_5_spatbn_1_rm
comp_5_spatbn_1_rivcomp_5_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_5_spatbn_1comp_5_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_5_spatbn_1
comp_5_conv_2_wcomp_5_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_5_spatbn_0
shortcut_projection_5_wshortcut_projection_5 "Conv*
exhaustive_search *
order"NCHW*

kernel*

stride2 :CUDNN|
shortcut_projection_5
comp_5_conv_2comp_5_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_5_sum_2
comp_6_spatbn_0_s
comp_6_spatbn_0_b
comp_6_spatbn_0_rm
comp_6_spatbn_0_rivcomp_6_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_6_spatbn_0comp_6_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_6_spatbn_0
comp_6_conv_1_wcomp_6_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_6_conv_1
comp_6_spatbn_1_s
comp_6_spatbn_1_b
comp_6_spatbn_1_rm
comp_6_spatbn_1_rivcomp_6_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_6_spatbn_1comp_6_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_6_spatbn_1
comp_6_conv_2_wcomp_6_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNs
comp_5_sum_2
comp_6_conv_2comp_6_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_6_sum_2
comp_7_spatbn_0_s
comp_7_spatbn_0_b
comp_7_spatbn_0_rm
comp_7_spatbn_0_rivcomp_7_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_7_spatbn_0comp_7_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_7_spatbn_0
comp_7_conv_1_wcomp_7_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_7_conv_1
comp_7_spatbn_1_s
comp_7_spatbn_1_b
comp_7_spatbn_1_rm
comp_7_spatbn_1_rivcomp_7_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_7_spatbn_1comp_7_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_7_spatbn_1
comp_7_conv_2_wcomp_7_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNs
comp_6_sum_2
comp_7_conv_2comp_7_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_7_sum_2
comp_8_spatbn_0_s
comp_8_spatbn_0_b
comp_8_spatbn_0_rm
comp_8_spatbn_0_rivcomp_8_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_8_spatbn_0comp_8_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_8_spatbn_0
comp_8_conv_1_wcomp_8_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_8_conv_1
comp_8_spatbn_1_s
comp_8_spatbn_1_b
comp_8_spatbn_1_rm
comp_8_spatbn_1_rivcomp_8_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_8_spatbn_1comp_8_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_8_spatbn_1
comp_8_conv_2_wcomp_8_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNs
comp_7_sum_2
comp_8_conv_2comp_8_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_8_sum_2
comp_9_spatbn_0_s
comp_9_spatbn_0_b
comp_9_spatbn_0_rm
comp_9_spatbn_0_rivcomp_9_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_9_spatbn_0comp_9_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_9_spatbn_0
comp_9_conv_1_wcomp_9_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_9_conv_1
comp_9_spatbn_1_s
comp_9_spatbn_1_b
comp_9_spatbn_1_rm
comp_9_spatbn_1_rivcomp_9_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 c
comp_9_spatbn_1comp_9_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_9_spatbn_1
comp_9_conv_2_wcomp_9_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNs
comp_8_sum_2
comp_9_conv_2comp_9_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_9_sum_2
comp_10_spatbn_0_s
comp_10_spatbn_0_b
comp_10_spatbn_0_rm
comp_10_spatbn_0_rivcomp_10_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 e
comp_10_spatbn_0comp_10_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_10_spatbn_0
comp_10_conv_1_wcomp_10_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_10_conv_1
comp_10_spatbn_1_s
comp_10_spatbn_1_b
comp_10_spatbn_1_rm
comp_10_spatbn_1_rivcomp_10_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 e
comp_10_spatbn_1comp_10_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_10_spatbn_1
comp_10_conv_2_wcomp_10_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_10_spatbn_0
shortcut_projection_10_wshortcut_projection_10 "Conv*
exhaustive_search *
order"NCHW*

kernel*

stride2 :CUDNN
shortcut_projection_10
comp_10_conv_2comp_10_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_10_sum_2
comp_11_spatbn_0_s
comp_11_spatbn_0_b
comp_11_spatbn_0_rm
comp_11_spatbn_0_rivcomp_11_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 e
comp_11_spatbn_0comp_11_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_11_spatbn_0
comp_11_conv_1_wcomp_11_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_11_conv_1
comp_11_spatbn_1_s
comp_11_spatbn_1_b
comp_11_spatbn_1_rm
comp_11_spatbn_1_rivcomp_11_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 e
comp_11_spatbn_1comp_11_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_11_spatbn_1
comp_11_conv_2_wcomp_11_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNv
comp_10_sum_2
comp_11_conv_2comp_11_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_11_sum_2
comp_12_spatbn_0_s
comp_12_spatbn_0_b
comp_12_spatbn_0_rm
comp_12_spatbn_0_rivcomp_12_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 e
comp_12_spatbn_0comp_12_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_12_spatbn_0
comp_12_conv_1_wcomp_12_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_12_conv_1
comp_12_spatbn_1_s
comp_12_spatbn_1_b
comp_12_spatbn_1_rm
comp_12_spatbn_1_rivcomp_12_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 e
comp_12_spatbn_1comp_12_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_12_spatbn_1
comp_12_conv_2_wcomp_12_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNv
comp_11_sum_2
comp_12_conv_2comp_12_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_12_sum_2
comp_13_spatbn_0_s
comp_13_spatbn_0_b
comp_13_spatbn_0_rm
comp_13_spatbn_0_rivcomp_13_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 e
comp_13_spatbn_0comp_13_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_13_spatbn_0
comp_13_conv_1_wcomp_13_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_13_conv_1
comp_13_spatbn_1_s
comp_13_spatbn_1_b
comp_13_spatbn_1_rm
comp_13_spatbn_1_rivcomp_13_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 e
comp_13_spatbn_1comp_13_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_13_spatbn_1
comp_13_conv_2_wcomp_13_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNv
comp_12_sum_2
comp_13_conv_2comp_13_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_13_sum_2
comp_14_spatbn_0_s
comp_14_spatbn_0_b
comp_14_spatbn_0_rm
comp_14_spatbn_0_rivcomp_14_spatbn_0 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 e
comp_14_spatbn_0comp_14_spatbn_0 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_14_spatbn_0
comp_14_conv_1_wcomp_14_conv_1 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNN�
comp_14_conv_1
comp_14_spatbn_1_s
comp_14_spatbn_1_b
comp_14_spatbn_1_rm
comp_14_spatbn_1_rivcomp_14_spatbn_1 "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 e
comp_14_spatbn_1comp_14_spatbn_1 "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN�
comp_14_spatbn_1
comp_14_conv_2_wcomp_14_conv_2 "Conv*
exhaustive_search *
order"NCHW*

kernel*
pad*

stride2 :CUDNNv
comp_13_sum_2
comp_14_conv_2comp_14_sum_2 "Sum*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 �
comp_14_sum_2
last_spatbn_s
last_spatbn_b
last_spatbn_rm
last_spatbn_rivlast_spatbn "	SpatialBN*
	use_cudnn*
epsilono�:*
cudnn_exhaustive_search *
order"NCHW*
is_test2 Y
last_spatbn	last_relu "Relu*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNNv
	last_relu	final_avg "AveragePool*

kernel*
cudnn_exhaustive_search *
order"NCHW*

stride2 :CUDNNt
	final_avg

last_out_w

last_out_blast_out "FC*
	use_cudnn*
order"NCHW*
cudnn_exhaustive_search 2 W
last_outsoftmax "Softmax*
order"NCHW*
cudnn_exhaustive_search 2 :CUDNN:data:conv1_w:comp_0_spatbn_0_s:comp_0_spatbn_0_b:comp_0_spatbn_0_rm:comp_0_spatbn_0_riv:comp_0_conv_1_w:comp_0_spatbn_1_s:comp_0_spatbn_1_b:comp_0_spatbn_1_rm:comp_0_spatbn_1_riv:comp_0_conv_2_w:comp_1_spatbn_0_s:comp_1_spatbn_0_b:comp_1_spatbn_0_rm:comp_1_spatbn_0_riv:comp_1_conv_1_w:comp_1_spatbn_1_s:comp_1_spatbn_1_b:comp_1_spatbn_1_rm:comp_1_spatbn_1_riv:comp_1_conv_2_w:comp_2_spatbn_0_s:comp_2_spatbn_0_b:comp_2_spatbn_0_rm:comp_2_spatbn_0_riv:comp_2_conv_1_w:comp_2_spatbn_1_s:comp_2_spatbn_1_b:comp_2_spatbn_1_rm:comp_2_spatbn_1_riv:comp_2_conv_2_w:comp_3_spatbn_0_s:comp_3_spatbn_0_b:comp_3_spatbn_0_rm:comp_3_spatbn_0_riv:comp_3_conv_1_w:comp_3_spatbn_1_s:comp_3_spatbn_1_b:comp_3_spatbn_1_rm:comp_3_spatbn_1_riv:comp_3_conv_2_w:comp_4_spatbn_0_s:comp_4_spatbn_0_b:comp_4_spatbn_0_rm:comp_4_spatbn_0_riv:comp_4_conv_1_w:comp_4_spatbn_1_s:comp_4_spatbn_1_b:comp_4_spatbn_1_rm:comp_4_spatbn_1_riv:comp_4_conv_2_w:comp_5_spatbn_0_s:comp_5_spatbn_0_b:comp_5_spatbn_0_rm:comp_5_spatbn_0_riv:comp_5_conv_1_w:comp_5_spatbn_1_s:comp_5_spatbn_1_b:comp_5_spatbn_1_rm:comp_5_spatbn_1_riv:comp_5_conv_2_w:shortcut_projection_5_w:comp_6_spatbn_0_s:comp_6_spatbn_0_b:comp_6_spatbn_0_rm:comp_6_spatbn_0_riv:comp_6_conv_1_w:comp_6_spatbn_1_s:comp_6_spatbn_1_b:comp_6_spatbn_1_rm:comp_6_spatbn_1_riv:comp_6_conv_2_w:comp_7_spatbn_0_s:comp_7_spatbn_0_b:comp_7_spatbn_0_rm:comp_7_spatbn_0_riv:comp_7_conv_1_w:comp_7_spatbn_1_s:comp_7_spatbn_1_b:comp_7_spatbn_1_rm:comp_7_spatbn_1_riv:comp_7_conv_2_w:comp_8_spatbn_0_s:comp_8_spatbn_0_b:comp_8_spatbn_0_rm:comp_8_spatbn_0_riv:comp_8_conv_1_w:comp_8_spatbn_1_s:comp_8_spatbn_1_b:comp_8_spatbn_1_rm:comp_8_spatbn_1_riv:comp_8_conv_2_w:comp_9_spatbn_0_s:comp_9_spatbn_0_b:comp_9_spatbn_0_rm:comp_9_spatbn_0_riv:comp_9_conv_1_w:comp_9_spatbn_1_s:comp_9_spatbn_1_b:comp_9_spatbn_1_rm:comp_9_spatbn_1_riv:comp_9_conv_2_w:comp_10_spatbn_0_s:comp_10_spatbn_0_b:comp_10_spatbn_0_rm:comp_10_spatbn_0_riv:comp_10_conv_1_w:comp_10_spatbn_1_s:comp_10_spatbn_1_b:comp_10_spatbn_1_rm:comp_10_spatbn_1_riv:comp_10_conv_2_w:shortcut_projection_10_w:comp_11_spatbn_0_s:comp_11_spatbn_0_b:comp_11_spatbn_0_rm:comp_11_spatbn_0_riv:comp_11_conv_1_w:comp_11_spatbn_1_s:comp_11_spatbn_1_b:comp_11_spatbn_1_rm:comp_11_spatbn_1_riv:comp_11_conv_2_w:comp_12_spatbn_0_s:comp_12_spatbn_0_b:comp_12_spatbn_0_rm:comp_12_spatbn_0_riv:comp_12_conv_1_w:comp_12_spatbn_1_s:comp_12_spatbn_1_b:comp_12_spatbn_1_rm:comp_12_spatbn_1_riv:comp_12_conv_2_w:comp_13_spatbn_0_s:comp_13_spatbn_0_b:comp_13_spatbn_0_rm:comp_13_spatbn_0_riv:comp_13_conv_1_w:comp_13_spatbn_1_s:comp_13_spatbn_1_b:comp_13_spatbn_1_rm:comp_13_spatbn_1_riv:comp_13_conv_2_w:comp_14_spatbn_0_s:comp_14_spatbn_0_b:comp_14_spatbn_0_rm:comp_14_spatbn_0_riv:comp_14_conv_1_w:comp_14_spatbn_1_s:comp_14_spatbn_1_b:comp_14_spatbn_1_rm:comp_14_spatbn_1_riv:comp_14_conv_2_w:last_spatbn_s:last_spatbn_b:last_spatbn_rm:last_spatbn_riv:
last_out_w:
last_out_b