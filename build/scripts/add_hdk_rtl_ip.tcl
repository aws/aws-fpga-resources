# =============================================================================
# Amazon FPGA Hardware Development Kit
#
# Copyright 2025 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License"). You may not use
# this file except in compliance with the License. A copy of the License is
# located at
#
#    http://aws.amazon.com/asl/
#
# or in the "license" file accompanying this file. This file is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
# implied. See the License for the specific language governing permissions and
# limitations under the License.
# =============================================================================

set HDK_SHELL_DIR $::env(HDK_COMMON_DIR)
set HDK_SHELL_DESIGN_DIR $::env(HDK_SHELL_DESIGN_DIR)



#Read AWS Design files
read_verilog [ list \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/sync.v \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/flop_ccf.sv \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/ccf_ctl.v \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/mgt_acc_axl.sv  \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/mgt_gen_axl.sv  \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/sh_ddr.sv \
  $HDK_SHELL_DESIGN_DIR/interfaces/cl_ports.vh
]

read_verilog [ list \
  $HDK_SHELL_DESIGN_DIR/../../lib/interfaces.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/aws_clk_gen.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/aws_clk_regs.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/axil_to_cfg_cnv.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/axis_flop_fifo.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/lib_pipe.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/bram_1w1r.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/bram_2rw.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/xpm_fifo.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/flop_fifo.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/flop_fifo_in.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/cdc_async_fifo.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/cdc_sync.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/ft_fifo_p.v \
  $HDK_SHELL_DESIGN_DIR/../../lib/ft_fifo.v \
  $HDK_SHELL_DESIGN_DIR/../../lib/ram_fifo_ft.sv \
  $HDK_SHELL_DESIGN_DIR/../../lib/rr_arb.sv
]

set_property USED_IN_SIMULATION 0 \
  [get_files [ list \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/sync.v \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/flop_ccf.sv \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/ccf_ctl.v \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/mgt_acc_axl.sv  \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/mgt_gen_axl.sv  \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/sh_ddr.sv \
  ]]


add_files -fileset sim_1 [ list \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/sim/sync.v \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/sim/mgt_acc_axl.sv \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/sim/mgt_gen_axl.sv \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/sim/ccf_ctl.v \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/sim/flop_ccf.sv \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/sim/sh_ddr.sv \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/sim/axi4_slave_bfm.sv
]

puts "AWS FPGA: Reading IP blocks";

#Read DDR IP
read_ip [ list \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_ddr4/cl_ddr4.xci
]



#Read IP for axi register slices
read_ip [ list \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_axi_clock_converter/cl_axi_clock_converter.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_axi_clock_converter_light/cl_axi_clock_converter_light.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/src_register_slice/src_register_slice.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/dest_register_slice/dest_register_slice.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/axi_clock_converter_0/axi_clock_converter_0.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/axi_register_slice/axi_register_slice.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/axi_register_slice_light/axi_register_slice_light.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_axi_register_slice_256/cl_axi_register_slice_256.xci
]


#For HBM
read_ip [ list \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_axi_clock_converter_256b/cl_axi_clock_converter_256b.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_hbm/cl_hbm.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_axi_width_cnv_512_to_256/cl_axi_width_cnv_512_to_256.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_hbm_mmcm/cl_hbm_mmcm.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_axi4_to_axi3_conv/cl_axi4_to_axi3_conv.xci
]

## Clocking IP's
read_ip [ list \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/clk_mmcm_a/clk_mmcm_a.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/clk_mmcm_b/clk_mmcm_b.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/clk_mmcm_c/clk_mmcm_c.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/clk_mmcm_hbm/clk_mmcm_hbm.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_clk_axil_xbar/cl_clk_axil_xbar.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_sda_axil_xbar/cl_sda_axil_xbar.xci
]

#Read IP for virtual jtag / ILA/VIO
read_ip [ list \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/ila_1/ila_1.xci\
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_debug_bridge/cl_debug_bridge.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/ila_vio_counter/ila_vio_counter.xci \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/vio_0/vio_0.xci
]

# Additional IP's that might be needed if using the DDR
read_ip [ list \
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_axi_interconnect/cl_axi_interconnect.xci\
  $HDK_SHELL_DESIGN_DIR/../../ip/cl_ip/cl_ip.srcs/sources_1/ip/cl_axi_interconnect_64G_ddr/cl_axi_interconnect_64G_ddr.xci
]
