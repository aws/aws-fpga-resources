-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue Aug 26 16:04:57 2025
-- Host        : rl8-x2iedn-32xl-0 running 64-bit Rocky Linux release 8.10 (Green Obsidian)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_5847_bs_switch_0_stub.vhdl
-- Design      : bd_5847_bs_switch_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu47p-fsvh2892-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_bscan_drck : in STD_LOGIC;
    s_bscan_reset : in STD_LOGIC;
    s_bscan_sel : in STD_LOGIC;
    s_bscan_capture : in STD_LOGIC;
    s_bscan_shift : in STD_LOGIC;
    s_bscan_update : in STD_LOGIC;
    s_bscan_tdi : in STD_LOGIC;
    s_bscan_runtest : in STD_LOGIC;
    s_bscan_tck : in STD_LOGIC;
    s_bscan_tms : in STD_LOGIC;
    s_bscanid_en : in STD_LOGIC;
    s_bscan_tdo : out STD_LOGIC;
    drck_0 : out STD_LOGIC;
    reset_0 : out STD_LOGIC;
    sel_0 : out STD_LOGIC;
    capture_0 : out STD_LOGIC;
    shift_0 : out STD_LOGIC;
    update_0 : out STD_LOGIC;
    tdi_0 : out STD_LOGIC;
    runtest_0 : out STD_LOGIC;
    tck_0 : out STD_LOGIC;
    tms_0 : out STD_LOGIC;
    bscanid_en_0 : out STD_LOGIC;
    tdo_0 : in STD_LOGIC;
    drck_1 : out STD_LOGIC;
    reset_1 : out STD_LOGIC;
    sel_1 : out STD_LOGIC;
    capture_1 : out STD_LOGIC;
    shift_1 : out STD_LOGIC;
    update_1 : out STD_LOGIC;
    tdi_1 : out STD_LOGIC;
    runtest_1 : out STD_LOGIC;
    tck_1 : out STD_LOGIC;
    tms_1 : out STD_LOGIC;
    bscanid_en_1 : out STD_LOGIC;
    tdo_1 : in STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "bd_5847_bs_switch_0,bs_switch_v1_0_5_bs_switch,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "bd_5847_bs_switch_0,bs_switch_v1_0_5_bs_switch,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=bs_switch,x_ipVersion=1.0,x_ipCoreRevision=5,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_USE_EXT_BSCAN=1,C_ONLY_PRIMITIVE=0,C_NUM_BS_MASTER=2,C_XDEVICEFAMILY=virtexuplusHBM,C_USER_SCAN_CHAIN=1}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "s_bscan_drck,s_bscan_reset,s_bscan_sel,s_bscan_capture,s_bscan_shift,s_bscan_update,s_bscan_tdi,s_bscan_runtest,s_bscan_tck,s_bscan_tms,s_bscanid_en,s_bscan_tdo,drck_0,reset_0,sel_0,capture_0,shift_0,update_0,tdi_0,runtest_0,tck_0,tms_0,bscanid_en_0,tdo_0,drck_1,reset_1,sel_1,capture_1,shift_1,update_1,tdi_1,runtest_1,tck_1,tms_1,bscanid_en_1,tdo_1";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_bscan_drck : signal is "xilinx.com:interface:bscan:1.0 s_bscan DRCK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of s_bscan_drck : signal is "slave";
  attribute X_INTERFACE_INFO of s_bscan_reset : signal is "xilinx.com:interface:bscan:1.0 s_bscan RESET";
  attribute X_INTERFACE_INFO of s_bscan_sel : signal is "xilinx.com:interface:bscan:1.0 s_bscan SEL";
  attribute X_INTERFACE_INFO of s_bscan_capture : signal is "xilinx.com:interface:bscan:1.0 s_bscan CAPTURE";
  attribute X_INTERFACE_INFO of s_bscan_shift : signal is "xilinx.com:interface:bscan:1.0 s_bscan SHIFT";
  attribute X_INTERFACE_INFO of s_bscan_update : signal is "xilinx.com:interface:bscan:1.0 s_bscan UPDATE";
  attribute X_INTERFACE_INFO of s_bscan_tdi : signal is "xilinx.com:interface:bscan:1.0 s_bscan TDI";
  attribute X_INTERFACE_INFO of s_bscan_runtest : signal is "xilinx.com:interface:bscan:1.0 s_bscan RUNTEST";
  attribute X_INTERFACE_INFO of s_bscan_tck : signal is "xilinx.com:interface:bscan:1.0 s_bscan TCK";
  attribute X_INTERFACE_INFO of s_bscan_tms : signal is "xilinx.com:interface:bscan:1.0 s_bscan TMS";
  attribute X_INTERFACE_INFO of s_bscanid_en : signal is "xilinx.com:interface:bscan:1.0 s_bscan BSCANID_EN";
  attribute X_INTERFACE_INFO of s_bscan_tdo : signal is "xilinx.com:interface:bscan:1.0 s_bscan TDO";
  attribute X_INTERFACE_INFO of drck_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan DRCK";
  attribute X_INTERFACE_MODE of drck_0 : signal is "master";
  attribute X_INTERFACE_INFO of reset_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan RESET";
  attribute X_INTERFACE_INFO of sel_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan SEL";
  attribute X_INTERFACE_INFO of capture_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan CAPTURE";
  attribute X_INTERFACE_INFO of shift_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan SHIFT";
  attribute X_INTERFACE_INFO of update_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan UPDATE";
  attribute X_INTERFACE_INFO of tdi_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan TDI";
  attribute X_INTERFACE_INFO of runtest_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan RUNTEST";
  attribute X_INTERFACE_INFO of tck_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan TCK";
  attribute X_INTERFACE_INFO of tms_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan TMS";
  attribute X_INTERFACE_INFO of bscanid_en_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan BSCANID_EN";
  attribute X_INTERFACE_INFO of tdo_0 : signal is "xilinx.com:interface:bscan:1.0 m0_bscan TDO";
  attribute X_INTERFACE_INFO of drck_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan DRCK";
  attribute X_INTERFACE_MODE of drck_1 : signal is "master";
  attribute X_INTERFACE_INFO of reset_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan RESET";
  attribute X_INTERFACE_INFO of sel_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan SEL";
  attribute X_INTERFACE_INFO of capture_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan CAPTURE";
  attribute X_INTERFACE_INFO of shift_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan SHIFT";
  attribute X_INTERFACE_INFO of update_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan UPDATE";
  attribute X_INTERFACE_INFO of tdi_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan TDI";
  attribute X_INTERFACE_INFO of runtest_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan RUNTEST";
  attribute X_INTERFACE_INFO of tck_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan TCK";
  attribute X_INTERFACE_INFO of tms_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan TMS";
  attribute X_INTERFACE_INFO of bscanid_en_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan BSCANID_EN";
  attribute X_INTERFACE_INFO of tdo_1 : signal is "xilinx.com:interface:bscan:1.0 m1_bscan TDO";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "bs_switch_v1_0_5_bs_switch,Vivado 2025.1";
begin
end;
