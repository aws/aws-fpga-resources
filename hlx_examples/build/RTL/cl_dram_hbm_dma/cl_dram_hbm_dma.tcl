# Amazon FPGA Hardware Development Kit
#
# Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

################################################################
# This is a generated script based on design: cl
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

set EXAMPLE_DIR $::env(HDK_DIR)/cl/examples/cl_dram_hbm_dma
set CL_DESIGN_DIR "${EXAMPLE_DIR}/design"
set VERIF_COMMON_DIR $::env(HDK_DIR)/common/verif/include
set CL_CONST_DIR "${EXAMPLE_DIR}/build/constraints"
set CL_VERIF_DIR "${EXAMPLE_DIR}/verif/tests"




read_verilog -sv [glob ${CL_DESIGN_DIR}/*.?v]
read_verilog -sv [glob ${CL_DESIGN_DIR}/*.vh]

read_verilog -sv [glob ${VERIF_COMMON_DIR}/*.vh]

add_files -fileset constrs_1 -norecurse  $::env(HDK_SHELL_DIR)/build/constraints/cl_ddr_timing_aws.xdc
set_property USED_IN {implementation} [get_files $::env(HDK_SHELL_DIR)/build/constraints/cl_ddr_timing_aws.xdc]
set_property PROCESSING_ORDER LATE [get_files $::env(HDK_SHELL_DIR)/build/constraints/cl_ddr_timing_aws.xdc]
set_property is_enabled true [get_files $::env(HDK_SHELL_DIR)/build/constraints/cl_ddr_timing_aws.xdc]

add_files -fileset constrs_1 -norecurse  ${CL_CONST_DIR}/cl_synth_user.xdc
set_property USED_IN {synthesis} [get_files ${CL_CONST_DIR}/cl_synth_user.xdc]
set_property PROCESSING_ORDER LATE [get_files ${CL_CONST_DIR}/cl_synth_user.xdc]

add_files -fileset constrs_1 -norecurse  $::env(HDK_SHELL_DIR)/build/constraints/xdma_shell_level_1_fp_cl.xdc
set_property USED_IN {implementation} [get_files $::env(HDK_SHELL_DIR)/build/constraints/xdma_shell_level_1_fp_cl.xdc]
set_property PROCESSING_ORDER LATE [get_files $::env(HDK_SHELL_DIR)/build/constraints/xdma_shell_level_1_fp_cl.xdc]
set_property is_enabled false [get_files $::env(HDK_SHELL_DIR)/build/constraints/xdma_shell_level_1_fp_cl.xdc]

add_files -fileset constrs_1 -norecurse  ${CL_CONST_DIR}/cl_timing_user.xdc
set_property USED_IN {implementation} [get_files */cl_timing_user.xdc]
set_property PROCESSING_ORDER LATE [get_files */cl_timing_user.xdc]
set_property is_enabled true [get_files */cl_timing_user.xdc]


add_files -fileset constrs_1 -norecurse  ${CL_CONST_DIR}/xdma_shell_cl_pnr_user.xdc
set_property USED_IN {implementation} [get_files */xdma_shell_cl_pnr_user.xdc]
set_property PROCESSING_ORDER LATE [get_files */xdma_shell_cl_pnr_user.xdc]
set_property is_enabled false [get_files */xdma_shell_cl_pnr_user.xdc]

set ::env(PNR_USER) [get_files */xdma_shell_cl_pnr_user.xdc]			

add_files -fileset sim_1 -norecurse ${CL_VERIF_DIR}/test_clk_recipe.sv
add_files -fileset sim_1 -norecurse ${CL_VERIF_DIR}/test_ddr.sv
add_files -fileset sim_1 -norecurse ${CL_VERIF_DIR}/test_ddr_peek_poke.sv
add_files -fileset sim_1 -norecurse ${CL_VERIF_DIR}/test_dram_dma.sv
add_files -fileset sim_1 -norecurse ${CL_VERIF_DIR}/test_dram_dma_axi_mstr.sv
add_files -fileset sim_1 -norecurse ${CL_VERIF_DIR}/test_int.sv
add_files -fileset sim_1 -norecurse ${CL_VERIF_DIR}/test_null.sv
add_files -fileset sim_1 -norecurse ${CL_VERIF_DIR}/test_peek_poke.sv
add_files -fileset sim_1 -norecurse ${CL_VERIF_DIR}/test_peek_poke_pcis_axsize.sv


update_compile_order -fileset sim_1

set_property verilog_define {CL_NAME=cl_dram_hbm_dma TEST_NAME=test_dram_dma} [get_filesets sim_1]

set_property include_dirs "$CL_DESIGN_DIR $VERIF_COMMON_DIR ${CL_VERIF_DIR}" [get_filesets sim_1]
