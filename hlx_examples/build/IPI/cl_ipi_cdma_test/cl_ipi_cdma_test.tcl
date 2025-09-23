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

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source cl_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvu9p-flgb2104-2-i
}


# CHANGE DESIGN NAME HERE
set design_name cl

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES:
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {
  set shell $::env(shell)

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create interface ports
  set S_SH [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aws_f1_sh1_rtl:1.0 S_SH ]


  # Create ports

  # Create instance: axi_apb_bridge_0, and set properties
  set axi_apb_bridge_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_apb_bridge axi_apb_bridge_0 ]
  set_property CONFIG.C_APB_NUM_SLAVES {1} $axi_apb_bridge_0


  # Create instance: axi_cdma_0, and set properties
  set axi_cdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_cdma axi_cdma_0 ]
  set_property -dict [list \
    CONFIG.C_ADDR_WIDTH {64} \
    CONFIG.C_INCLUDE_SF {1} \
    CONFIG.C_INCLUDE_SG {0} \
    CONFIG.C_M_AXI_DATA_WIDTH {512} \
    CONFIG.C_M_AXI_MAX_BURST_LEN {64} \
  ] $axi_cdma_0


  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio axi_gpio_0 ]
  set_property -dict [list \
    CONFIG.C_ALL_INPUTS {1} \
    CONFIG.C_GPIO_WIDTH {2} \
  ] $axi_gpio_0


  # Create instance: axi_register_slice_hbm, and set properties
  set axi_register_slice_hbm [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice axi_register_slice_hbm ]


  set_property -dict [list \
    CONFIG.REG_AR {15} \
    CONFIG.REG_AW {15} \
    CONFIG.REG_B {15} \
    CONFIG.REG_R {15} \
    CONFIG.REG_W {15} \
  ] $axi_register_slice_hbm

  set_property -dict [list \
    CONFIG.NUM_SLR_CROSSINGS {2} \
    CONFIG.PIPELINES_MASTER_AR {2} \
    CONFIG.PIPELINES_MASTER_AW {2} \
    CONFIG.PIPELINES_MASTER_B {2} \
    CONFIG.PIPELINES_MASTER_R {2} \
    CONFIG.PIPELINES_MASTER_W {2} \
    CONFIG.PIPELINES_MIDDLE_AR {2} \
    CONFIG.PIPELINES_MIDDLE_AW {2} \
    CONFIG.PIPELINES_MIDDLE_B {2} \
    CONFIG.PIPELINES_MIDDLE_R {2} \
    CONFIG.PIPELINES_MIDDLE_W {2} \
    CONFIG.PIPELINES_SLAVE_AR {2} \
    CONFIG.PIPELINES_SLAVE_AW {2} \
    CONFIG.PIPELINES_SLAVE_B {2} \
    CONFIG.PIPELINES_SLAVE_R {2} \
    CONFIG.PIPELINES_SLAVE_W {2} \
  ] $axi_register_slice_hbm

if {$shell == "small_shell" } {
set_property CONFIG.NUM_SLR_CROSSINGS {1} $axi_register_slice_hbm

set axi_register_slice_ddr4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice axi_register_slice_ddr4 ]

  set_property -dict [list \
    CONFIG.REG_AR {15} \
    CONFIG.REG_AW {15} \
    CONFIG.REG_B {15} \
    CONFIG.REG_R {15} \
    CONFIG.REG_W {15} \
  ] $axi_register_slice_ddr4

  set_property -dict [list \
    CONFIG.NUM_SLR_CROSSINGS {1} \
    CONFIG.PIPELINES_MASTER_AR {2} \
    CONFIG.PIPELINES_MASTER_AW {2} \
    CONFIG.PIPELINES_MASTER_B {2} \
    CONFIG.PIPELINES_MASTER_R {2} \
    CONFIG.PIPELINES_MASTER_W {2} \
    CONFIG.PIPELINES_SLAVE_AR {2} \
    CONFIG.PIPELINES_SLAVE_AW {2} \
    CONFIG.PIPELINES_SLAVE_B {2} \
    CONFIG.PIPELINES_SLAVE_R {2} \
    CONFIG.PIPELINES_SLAVE_W {2} \
  ] $axi_register_slice_ddr4

}


  # Create instance: axi_smc_cdma, and set properties
  set axi_smc_cdma [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect axi_smc_cdma ]
  set_property -dict [list \
    CONFIG.NUM_MI {2} \
    CONFIG.NUM_SI {1} \
  ] $axi_smc_cdma


  # Create instance: axi_smc_pcis, and set properties
  set axi_smc_pcis [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect axi_smc_pcis ]
  set_property -dict [list \
    CONFIG.NUM_MI {2} \
    CONFIG.NUM_SI {1} \
  ] $axi_smc_pcis


  # Create instance: f2_inst, and set properties
  set f2_inst [ create_bd_cell -type ip -vlnv xilinx.com:ip:aws f2_inst ]
  set_property -dict [list \
    CONFIG.DDR_A_PRESENT {1} \
    CONFIG.HBM_PRESENT {1} \
    CONFIG.NUM_STAGES_STATS {2} \
    CONFIG.OCL_PRESENT {1} \
    CONFIG.PCIS_PRESENT {1} \
  ] $f2_inst


  # Create instance: f2_inst_axi_periph, and set properties
  set f2_inst_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect f2_inst_axi_periph ]
  set_property -dict [list \
    CONFIG.M00_HAS_REGSLICE {4} \
    CONFIG.M01_HAS_REGSLICE {4} \
    CONFIG.M02_HAS_REGSLICE {4} \
    CONFIG.NUM_MI {3} \
    CONFIG.S00_HAS_REGSLICE {4} \
    CONFIG.STRATEGY {1} \
  ] $f2_inst_axi_periph


  # Create instance: hbm_0, and set properties
  set hbm_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:hbm hbm_0 ]
  set_property -dict [list \
    CONFIG.USER_APB_EN {true} \
    CONFIG.USER_CLK_SEL_LIST0 {AXI_00_ACLK} \
    CONFIG.USER_DIS_REF_CLK_BUFG {TRUE} \
    CONFIG.USER_MON_APB_EN {true} \
    CONFIG.USER_SAXI_01 {false} \
    CONFIG.USER_SAXI_02 {false} \
    CONFIG.USER_SAXI_03 {false} \
    CONFIG.USER_SAXI_04 {false} \
    CONFIG.USER_SAXI_05 {false} \
    CONFIG.USER_SAXI_06 {false} \
    CONFIG.USER_SAXI_07 {false} \
    CONFIG.USER_SAXI_08 {false} \
    CONFIG.USER_SAXI_09 {false} \
    CONFIG.USER_SAXI_10 {false} \
    CONFIG.USER_SAXI_11 {false} \
    CONFIG.USER_SAXI_12 {false} \
    CONFIG.USER_SAXI_13 {false} \
    CONFIG.USER_SAXI_14 {false} \
    CONFIG.USER_SAXI_15 {false} \
    CONFIG.USER_SINGLE_STACK_SELECTION {RIGHT} \
  ] $hbm_0


  # Create instance: proc_sys_reset_a0, and set properties
  set proc_sys_reset_a0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset proc_sys_reset_a0 ]

  # Create instance: proc_sys_reset_apb, and set properties
  set proc_sys_reset_apb [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset proc_sys_reset_apb ]

  # Create instance: proc_sys_reset_hbm_aclk, and set properties
  set proc_sys_reset_hbm_aclk [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset proc_sys_reset_hbm_aclk ]

  # Create instance: proc_sys_reset_hbm_reg, and set properties
  set proc_sys_reset_hbm_reg [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset proc_sys_reset_hbm_reg ]

  # Create instance: smartconnect_ddr4, and set properties
  set smartconnect_ddr4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect smartconnect_ddr4 ]

  # Create instance: smartconnect_hbm, and set properties
  set smartconnect_hbm [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect smartconnect_hbm ]
  set_property CONFIG.NUM_CLKS {2} $smartconnect_hbm


  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat xlconcat_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn [get_bd_intf_pins f2_inst/MON_SAPB_0] [get_bd_intf_pins hbm_0/MON_MAPB_0]

  connect_bd_intf_net -intf_net axi_apb_bridge_0_APB_M [get_bd_intf_pins axi_apb_bridge_0/APB_M] [get_bd_intf_pins hbm_0/SAPB_0]
  connect_bd_intf_net -intf_net axi_cdma_0_M_AXI [get_bd_intf_pins axi_cdma_0/M_AXI] [get_bd_intf_pins axi_smc_cdma/S00_AXI]
  connect_bd_intf_net -intf_net axi_register_slice_hbm_M_AXI [get_bd_intf_pins axi_register_slice_hbm/M_AXI] [get_bd_intf_pins hbm_0/SAXI_00_RT_8HI]
  connect_bd_intf_net -intf_net axi_smc_cdma_M00_AXI [get_bd_intf_pins axi_smc_cdma/M00_AXI] [get_bd_intf_pins smartconnect_ddr4/S01_AXI]
  connect_bd_intf_net -intf_net axi_smc_cdma_M01_AXI [get_bd_intf_pins axi_smc_cdma/M01_AXI] [get_bd_intf_pins smartconnect_hbm/S01_AXI]
  connect_bd_intf_net -intf_net axi_smc_pcis_M00_AXI [get_bd_intf_pins axi_smc_pcis/M00_AXI] [get_bd_intf_pins smartconnect_ddr4/S00_AXI]
  connect_bd_intf_net -intf_net axi_smc_pcis_M01_AXI [get_bd_intf_pins axi_smc_pcis/M01_AXI] [get_bd_intf_pins smartconnect_hbm/S00_AXI]
  connect_bd_intf_net -intf_net f2_inst_M_AXI_OCL [get_bd_intf_pins f2_inst/M_AXI_OCL] [get_bd_intf_pins f2_inst_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net f2_inst_M_AXI_PCIS [get_bd_intf_pins axi_smc_pcis/S00_AXI] [get_bd_intf_pins f2_inst/M_AXI_PCIS]
  connect_bd_intf_net -intf_net f2_inst_S_SH [get_bd_intf_ports S_SH] [get_bd_intf_pins f2_inst/S_SH]
  connect_bd_intf_net -intf_net f2_inst_axi_periph_M00_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins f2_inst_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net f2_inst_axi_periph_M01_AXI [get_bd_intf_pins axi_cdma_0/S_AXI_LITE] [get_bd_intf_pins f2_inst_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net f2_inst_axi_periph_M02_AXI [get_bd_intf_pins axi_apb_bridge_0/AXI4_LITE] [get_bd_intf_pins f2_inst_axi_periph/M02_AXI]
  if {$shell == "small_shell" } {
  connect_bd_intf_net -intf_net axi_register_slice_ddr4_M_AXI [get_bd_intf_pins axi_register_slice_ddr4/M_AXI] [get_bd_intf_pins f2_inst/S_AXI_DDRA]
  connect_bd_intf_net -intf_net smartconnect_ddr4_M00_AXI [get_bd_intf_pins axi_register_slice_ddr4/S_AXI] [get_bd_intf_pins smartconnect_ddr4/M00_AXI]
  } else {
  connect_bd_intf_net -intf_net smartconnect_ddr4_M00_AXI [get_bd_intf_pins f2_inst/S_AXI_DDRA] [get_bd_intf_pins smartconnect_ddr4/M00_AXI]
  }
  connect_bd_intf_net -intf_net smartconnect_hbm_M00_AXI [get_bd_intf_pins axi_register_slice_hbm/S_AXI] [get_bd_intf_pins smartconnect_hbm/M00_AXI]

  # Create port connections
  if {$shell == "small_shell" } {
  connect_bd_net -net M01_ARESETN_1 [get_bd_pins axi_register_slice_ddr4/aresetn] [get_bd_pins f2_inst_axi_periph/ARESETN] [get_bd_pins f2_inst_axi_periph/M00_ARESETN] [get_bd_pins f2_inst_axi_periph/S00_ARESETN] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_smc_cdma/aresetn] [get_bd_pins axi_cdma_0/s_axi_lite_aresetn] [get_bd_pins axi_smc_pcis/aresetn] [get_bd_pins f2_inst_axi_periph/M01_ARESETN] [get_bd_pins proc_sys_reset_a0/peripheral_aresetn] [get_bd_pins smartconnect_ddr4/aresetn] [get_bd_pins smartconnect_hbm/aresetn]
  } else {
  connect_bd_net -net M01_ARESETN_1 [get_bd_pins f2_inst_axi_periph/ARESETN] [get_bd_pins f2_inst_axi_periph/M00_ARESETN] [get_bd_pins f2_inst_axi_periph/S00_ARESETN] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_smc_cdma/aresetn] [get_bd_pins axi_cdma_0/s_axi_lite_aresetn] [get_bd_pins axi_smc_pcis/aresetn] [get_bd_pins f2_inst_axi_periph/M01_ARESETN] [get_bd_pins proc_sys_reset_a0/peripheral_aresetn] [get_bd_pins smartconnect_ddr4/aresetn] [get_bd_pins smartconnect_hbm/aresetn]
  }
  connect_bd_net -net f2_inst_clk_hbm_axi_out [get_bd_pins axi_register_slice_hbm/aclk] [get_bd_pins f2_inst/clk_hbm_axi_out] [get_bd_pins hbm_0/AXI_00_ACLK] [get_bd_pins proc_sys_reset_hbm_aclk/slowest_sync_clk] [get_bd_pins proc_sys_reset_hbm_reg/slowest_sync_clk] [get_bd_pins smartconnect_hbm/aclk1]
  connect_bd_net -net f2_inst_clk_hbm_ref_out [get_bd_pins axi_apb_bridge_0/s_axi_aclk] [get_bd_pins f2_inst/clk_hbm_ref_out] [get_bd_pins f2_inst_axi_periph/M02_ACLK] [get_bd_pins hbm_0/APB_0_PCLK] [get_bd_pins hbm_0/HBM_REF_CLK_0] [get_bd_pins proc_sys_reset_apb/slowest_sync_clk]

  if {$shell == "small_shell" } {
  connect_bd_net -net f2_inst_clk_main_a0_out [get_bd_pins axi_register_slice_ddr4/aclk] [get_bd_pins axi_cdma_0/m_axi_aclk] [get_bd_pins axi_cdma_0/s_axi_lite_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_smc_cdma/aclk] [get_bd_pins axi_smc_pcis/aclk] [get_bd_pins f2_inst/clk_main_a0_out] [get_bd_pins f2_inst_axi_periph/ACLK] [get_bd_pins f2_inst_axi_periph/M00_ACLK] [get_bd_pins f2_inst_axi_periph/M01_ACLK] [get_bd_pins f2_inst_axi_periph/S00_ACLK] [get_bd_pins proc_sys_reset_a0/slowest_sync_clk] [get_bd_pins smartconnect_ddr4/aclk] [get_bd_pins smartconnect_hbm/aclk]
  } else {
  connect_bd_net -net f2_inst_clk_main_a0_out [get_bd_pins axi_cdma_0/m_axi_aclk] [get_bd_pins axi_cdma_0/s_axi_lite_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_smc_cdma/aclk] [get_bd_pins axi_smc_pcis/aclk] [get_bd_pins f2_inst/clk_main_a0_out] [get_bd_pins f2_inst_axi_periph/ACLK] [get_bd_pins f2_inst_axi_periph/M00_ACLK] [get_bd_pins f2_inst_axi_periph/M01_ACLK] [get_bd_pins f2_inst_axi_periph/S00_ACLK] [get_bd_pins proc_sys_reset_a0/slowest_sync_clk] [get_bd_pins smartconnect_ddr4/aclk] [get_bd_pins smartconnect_hbm/aclk]
  }

  connect_bd_net -net f2_inst_ddra_is_ready [get_bd_pins f2_inst/ddra_is_ready] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net f2_inst_mon_apb_0_preset_n_out [get_bd_pins f2_inst/mon_apb_0_preset_n_out] [get_bd_pins hbm_0/MON_APB_0_PRESET_N]
  connect_bd_net -net f2_inst_rst_main_n_out  [get_bd_pins f2_inst/rst_main_n_out]  [get_bd_pins proc_sys_reset_a0/ext_reset_in] [get_bd_pins proc_sys_reset_apb/ext_reset_in] [get_bd_pins proc_sys_reset_hbm_aclk/ext_reset_in] [get_bd_pins proc_sys_reset_hbm_reg/ext_reset_in]
  connect_bd_net -net hbm_0_apb_complete_0 [get_bd_pins hbm_0/apb_complete_0] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net proc_sys_reset_apb_peripheral_aresetn [get_bd_pins axi_apb_bridge_0/s_axi_aresetn] [get_bd_pins f2_inst_axi_periph/M02_ARESETN] [get_bd_pins hbm_0/APB_0_PRESET_N] [get_bd_pins proc_sys_reset_apb/peripheral_aresetn]
  connect_bd_net -net proc_sys_reset_hbm_aclk_peripheral_aresetn [get_bd_pins hbm_0/AXI_00_ARESET_N] [get_bd_pins proc_sys_reset_hbm_aclk/peripheral_aresetn]
  connect_bd_net -net proc_sys_reset_hbm_reg_peripheral_aresetn [get_bd_pins axi_register_slice_hbm/aresetn] [get_bd_pins proc_sys_reset_hbm_reg/peripheral_aresetn]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins axi_gpio_0/gpio_io_i] [get_bd_pins xlconcat_0/dout]


  # Create address segments

  assign_bd_address -offset 0x001000000000 -range 0x001000000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs f2_inst/S_AXI_DDRA/Mem_DDRA] -force
  assign_bd_address -offset 0x000200000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM00] -force
  assign_bd_address -offset 0x000220000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM01] -force
  assign_bd_address -offset 0x000240000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM02] -force
  assign_bd_address -offset 0x000260000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM03] -force
  assign_bd_address -offset 0x000280000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM04] -force
  assign_bd_address -offset 0x0002A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM05] -force
  assign_bd_address -offset 0x0002C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM06] -force
  assign_bd_address -offset 0x0002E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM07] -force
  assign_bd_address -offset 0x000300000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM08] -force
  assign_bd_address -offset 0x000320000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM09] -force
  assign_bd_address -offset 0x000340000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM10] -force
  assign_bd_address -offset 0x000360000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM11] -force
  assign_bd_address -offset 0x000380000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM12] -force
  assign_bd_address -offset 0x0003A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM13] -force
  assign_bd_address -offset 0x0003C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM14] -force
  assign_bd_address -offset 0x0003E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_cdma_0/Data] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM15] -force
  assign_bd_address -offset 0x00000000 -range 0x00000100 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_OCL] [get_bd_addr_segs axi_cdma_0/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0x00010000 -range 0x00001000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_OCL] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x00400000 -range 0x00400000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_OCL] [get_bd_addr_segs hbm_0/SAPB_0/Reg] -force
  assign_bd_address -offset 0x001000000000 -range 0x001000000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs f2_inst/S_AXI_DDRA/Mem_DDRA] -force
  assign_bd_address -offset 0x000200000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM00] -force
  assign_bd_address -offset 0x000220000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM01] -force
  assign_bd_address -offset 0x000240000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM02] -force
  assign_bd_address -offset 0x000260000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM03] -force
  assign_bd_address -offset 0x000280000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM04] -force
  assign_bd_address -offset 0x0002A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM05] -force
  assign_bd_address -offset 0x0002C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM06] -force
  assign_bd_address -offset 0x0002E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM07] -force
  assign_bd_address -offset 0x000300000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM08] -force
  assign_bd_address -offset 0x000320000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM09] -force
  assign_bd_address -offset 0x000340000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM10] -force
  assign_bd_address -offset 0x000360000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM11] -force
  assign_bd_address -offset 0x000380000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM12] -force
  assign_bd_address -offset 0x0003A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM13] -force
  assign_bd_address -offset 0x0003C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM14] -force
  assign_bd_address -offset 0x0003E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces f2_inst/M_AXI_PCIS] [get_bd_addr_segs hbm_0/SAXI_00_RT_8HI/HBM_MEM15] -force

  set_property range 4K [get_bd_addr_segs {f2_inst/M_AXI_OCL/SEG_axi_cdma_0_Reg}]

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""
