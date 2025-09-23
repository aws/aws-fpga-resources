###############################################################################
##
## (c) Copyright 2017 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.
##

proc init { cell_name undefined_params } {

  set cell [get_bd_cells $cell_name]
  set_property CONFIG.ASSOCIATED_BUSIF {M_AXI_PCIS:S_AXI_PCIM:S_AXI_DDRA:M_AXI_OCL} [get_bd_pins $cell_name/clk_main_a0_out]
  set_property CONFIG.ASSOCIATED_RESET {rst_main_n_out} [get_bd_pins $cell_name/clk_main_a0_out]

  set_property CONFIG.POLARITY.VALUE_SRC CONSTANT [get_bd_pins $cell_name/rst_main_n_out]

  if {[get_property CONFIG.PCIS_PRESENT $cell] > 0} {
    set_property CONFIG.NUM_READ_OUTSTANDING 64 [get_bd_intf_pins $cell_name/M_AXI_PCIS]
    set_property CONFIG.NUM_WRITE_OUTSTANDING 32 [get_bd_intf_pins $cell_name/M_AXI_PCIS]
    set_property CONFIG.NUM_READ_THREADS 4 [get_bd_intf_pins $cell_name/M_AXI_PCIS]
    set_property CONFIG.NUM_WRITE_THREADS 4 [get_bd_intf_pins $cell_name/M_AXI_PCIS]
    set_property CONFIG.HAS_BURST 0 [get_bd_intf_pins $cell_name/M_AXI_PCIS]
    set_property CONFIG.SUPPORTS_NARROW_BURST 0 [get_bd_intf_pins $cell_name/M_AXI_PCIS]
  }
  
  if {[get_property CONFIG.PCIM_PRESENT $cell] > 0} {
    set_property CONFIG.NUM_READ_OUTSTANDING 64 [get_bd_intf_pins $cell_name/S_AXI_PCIM]
    set_property CONFIG.NUM_WRITE_OUTSTANDING 32 [get_bd_intf_pins $cell_name/S_AXI_PCIM]
    set_property CONFIG.NUM_READ_THREADS 5 [get_bd_intf_pins $cell_name/S_AXI_PCIM]
    set_property CONFIG.NUM_WRITE_THREADS 5 [get_bd_intf_pins $cell_name/S_AXI_PCIM]
    set_property CONFIG.HAS_BURST 0 [get_bd_intf_pins $cell_name/S_AXI_PCIM]
    set_property CONFIG.SUPPORTS_NARROW_BURST 0 [get_bd_intf_pins $cell_name/S_AXI_PCIM]
  }
  
}

proc post_config_ip { cell_name args } {
  set cell [get_bd_cells $cell_name]
  set_property CONFIG.FREQ_HZ [get_property CONFIG.CLOCK_A0_FREQ $cell] [get_bd_pins $cell_name/clk_main_a0_out]
  if {[get_property CONFIG.NUM_A_CLOCKS $cell] > 1} {set_property CONFIG.ASSOCIATED_RESET {rst_a1_n_out} [get_bd_pins $cell_name/clk_extra_a1_out]}
  if {[get_property CONFIG.NUM_A_CLOCKS $cell] > 2} {set_property CONFIG.ASSOCIATED_RESET {rst_a2_n_out} [get_bd_pins $cell_name/clk_extra_a2_out]}
  if {[get_property CONFIG.NUM_A_CLOCKS $cell] > 3} {set_property CONFIG.ASSOCIATED_RESET {rst_a3_n_out} [get_bd_pins $cell_name/clk_extra_a3_out]}
  if {[get_property CONFIG.NUM_B_CLOCKS $cell] > 0} {set_property CONFIG.ASSOCIATED_RESET {rst_b0_n_out} [get_bd_pins $cell_name/clk_extra_b0_out]}
  if {[get_property CONFIG.NUM_B_CLOCKS $cell] > 1} {set_property CONFIG.ASSOCIATED_RESET {rst_b1_n_out} [get_bd_pins $cell_name/clk_extra_b1_out]}
  if {[get_property CONFIG.NUM_C_CLOCKS $cell] > 0} {set_property CONFIG.ASSOCIATED_RESET {rst_c0_n_out} [get_bd_pins $cell_name/clk_extra_c0_out]}
  if {[get_property CONFIG.NUM_C_CLOCKS $cell] > 1} {set_property CONFIG.ASSOCIATED_RESET {rst_c1_n_out} [get_bd_pins $cell_name/clk_extra_c1_out]}
  if {[get_property CONFIG.HBM_PRESENT  $cell] > 0} {set_property CONFIG.ASSOCIATED_RESET {rst_hbm_axi_n_out} [get_bd_pins $cell_name/clk_hbm_axi_out]}
  if {[get_property CONFIG.HBM_PRESENT  $cell] > 0} {set_property CONFIG.ASSOCIATED_RESET {rst_hbm_ref_n_out} [get_bd_pins $cell_name/clk_hbm_ref_out]}
}









  