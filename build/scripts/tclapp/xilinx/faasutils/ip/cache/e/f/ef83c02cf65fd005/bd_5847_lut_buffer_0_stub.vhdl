-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue Aug 26 16:04:58 2025
-- Host        : rl8-x2iedn-32xl-0 running 64-bit Rocky Linux release 8.10 (Green Obsidian)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_5847_lut_buffer_0_stub.vhdl
-- Design      : bd_5847_lut_buffer_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu47p-fsvh2892-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    tdi_i : in STD_LOGIC;
    tms_i : in STD_LOGIC;
    tck_i : in STD_LOGIC;
    drck_i : in STD_LOGIC;
    sel_i : in STD_LOGIC;
    shift_i : in STD_LOGIC;
    update_i : in STD_LOGIC;
    capture_i : in STD_LOGIC;
    runtest_i : in STD_LOGIC;
    reset_i : in STD_LOGIC;
    bscanid_en_i : in STD_LOGIC;
    tdo_o : out STD_LOGIC;
    tdi_o : out STD_LOGIC;
    tms_o : out STD_LOGIC;
    tck_o : out STD_LOGIC;
    drck_o : out STD_LOGIC;
    sel_o : out STD_LOGIC;
    shift_o : out STD_LOGIC;
    update_o : out STD_LOGIC;
    capture_o : out STD_LOGIC;
    runtest_o : out STD_LOGIC;
    reset_o : out STD_LOGIC;
    bscanid_en_o : out STD_LOGIC;
    tdo_i : in STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "bd_5847_lut_buffer_0,lut_buffer_v2_0_1_lut_buffer,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "bd_5847_lut_buffer_0,lut_buffer_v2_0_1_lut_buffer,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=lut_buffer,x_ipVersion=2.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_EN_BSCANID_VEC=0}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "tdi_i,tms_i,tck_i,drck_i,sel_i,shift_i,update_i,capture_i,runtest_i,reset_i,bscanid_en_i,tdo_o,tdi_o,tms_o,tck_o,drck_o,sel_o,shift_o,update_o,capture_o,runtest_o,reset_o,bscanid_en_o,tdo_i";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of tdi_i : signal is "xilinx.com:interface:bscan:1.0 s_bscan TDI";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of tdi_i : signal is "slave";
  attribute X_INTERFACE_INFO of tms_i : signal is "xilinx.com:interface:bscan:1.0 s_bscan TMS";
  attribute X_INTERFACE_INFO of tck_i : signal is "xilinx.com:interface:bscan:1.0 s_bscan TCK";
  attribute X_INTERFACE_INFO of drck_i : signal is "xilinx.com:interface:bscan:1.0 s_bscan DRCK";
  attribute X_INTERFACE_INFO of sel_i : signal is "xilinx.com:interface:bscan:1.0 s_bscan SEL";
  attribute X_INTERFACE_INFO of shift_i : signal is "xilinx.com:interface:bscan:1.0 s_bscan SHIFT";
  attribute X_INTERFACE_INFO of update_i : signal is "xilinx.com:interface:bscan:1.0 s_bscan UPDATE";
  attribute X_INTERFACE_INFO of capture_i : signal is "xilinx.com:interface:bscan:1.0 s_bscan CAPTURE";
  attribute X_INTERFACE_INFO of runtest_i : signal is "xilinx.com:interface:bscan:1.0 s_bscan RUNTEST";
  attribute X_INTERFACE_INFO of reset_i : signal is "xilinx.com:interface:bscan:1.0 s_bscan RESET";
  attribute X_INTERFACE_INFO of bscanid_en_i : signal is "xilinx.com:interface:bscan:1.0 s_bscan BSCANID_EN";
  attribute X_INTERFACE_INFO of tdo_o : signal is "xilinx.com:interface:bscan:1.0 s_bscan TDO";
  attribute X_INTERFACE_INFO of tdi_o : signal is "xilinx.com:interface:bscan:1.0 m_bscan TDI";
  attribute X_INTERFACE_MODE of tdi_o : signal is "master";
  attribute X_INTERFACE_INFO of tms_o : signal is "xilinx.com:interface:bscan:1.0 m_bscan TMS";
  attribute X_INTERFACE_INFO of tck_o : signal is "xilinx.com:interface:bscan:1.0 m_bscan TCK";
  attribute X_INTERFACE_INFO of drck_o : signal is "xilinx.com:interface:bscan:1.0 m_bscan DRCK";
  attribute X_INTERFACE_INFO of sel_o : signal is "xilinx.com:interface:bscan:1.0 m_bscan SEL";
  attribute X_INTERFACE_INFO of shift_o : signal is "xilinx.com:interface:bscan:1.0 m_bscan SHIFT";
  attribute X_INTERFACE_INFO of update_o : signal is "xilinx.com:interface:bscan:1.0 m_bscan UPDATE";
  attribute X_INTERFACE_INFO of capture_o : signal is "xilinx.com:interface:bscan:1.0 m_bscan CAPTURE";
  attribute X_INTERFACE_INFO of runtest_o : signal is "xilinx.com:interface:bscan:1.0 m_bscan RUNTEST";
  attribute X_INTERFACE_INFO of reset_o : signal is "xilinx.com:interface:bscan:1.0 m_bscan RESET";
  attribute X_INTERFACE_INFO of bscanid_en_o : signal is "xilinx.com:interface:bscan:1.0 m_bscan BSCANID_EN";
  attribute X_INTERFACE_INFO of tdo_i : signal is "xilinx.com:interface:bscan:1.0 m_bscan TDO";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "lut_buffer_v2_0_1_lut_buffer,Vivado 2025.1";
begin
end;
