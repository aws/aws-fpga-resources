-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- -------------------------------------------------------------------------------
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- DO NOT MODIFY THIS FILE.

-- MODULE VLNV: amd.com:blockdesign:cl_axi_sc_1x1:1.0

-- The following code must appear in the VHDL architecture header.

-- COMP_TAG     ------ Begin cut for COMPONENT Declaration ------
COMPONENT cl_axi_sc_1x1
  PORT (
    AXI3_awaddr : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    AXI3_awlen : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI3_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI3_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI3_awlock : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI3_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI3_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI3_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI3_awvalid : OUT STD_LOGIC;
    AXI3_awready : IN STD_LOGIC;
    AXI3_wdata : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    AXI3_wstrb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI3_wlast : OUT STD_LOGIC;
    AXI3_wvalid : OUT STD_LOGIC;
    AXI3_wready : IN STD_LOGIC;
    AXI3_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI3_bvalid : IN STD_LOGIC;
    AXI3_bready : OUT STD_LOGIC;
    AXI3_araddr : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    AXI3_arlen : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI3_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI3_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI3_arlock : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI3_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI3_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI3_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI3_arvalid : OUT STD_LOGIC;
    AXI3_arready : IN STD_LOGIC;
    AXI3_rdata : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
    AXI3_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI3_rlast : IN STD_LOGIC;
    AXI3_rvalid : IN STD_LOGIC;
    AXI3_rready : OUT STD_LOGIC;
    AXI4_awid : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    AXI4_awaddr : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    AXI4_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    AXI4_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_awvalid : IN STD_LOGIC;
    AXI4_awready : OUT STD_LOGIC;
    AXI4_wdata : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    AXI4_wstrb : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    AXI4_wlast : IN STD_LOGIC;
    AXI4_wvalid : IN STD_LOGIC;
    AXI4_wready : OUT STD_LOGIC;
    AXI4_bid : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    AXI4_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_bvalid : OUT STD_LOGIC;
    AXI4_bready : IN STD_LOGIC;
    AXI4_arid : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    AXI4_araddr : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    AXI4_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    AXI4_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_arvalid : IN STD_LOGIC;
    AXI4_arready : OUT STD_LOGIC;
    AXI4_rid : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    AXI4_rdata : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    AXI4_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_rlast : OUT STD_LOGIC;
    AXI4_rvalid : OUT STD_LOGIC;
    AXI4_rready : IN STD_LOGIC;
    aclk_250 : IN STD_LOGIC;
    aclk_450 : IN STD_LOGIC;
    aresetn_250 : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------  End cut for COMPONENT Declaration  ------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

-- INST_TAG     ------ Begin cut for INSTANTIATION Template ------
your_instance_name : cl_axi_sc_1x1
  PORT MAP (
    AXI3_awaddr => AXI3_awaddr,
    AXI3_awlen => AXI3_awlen,
    AXI3_awsize => AXI3_awsize,
    AXI3_awburst => AXI3_awburst,
    AXI3_awlock => AXI3_awlock,
    AXI3_awcache => AXI3_awcache,
    AXI3_awprot => AXI3_awprot,
    AXI3_awqos => AXI3_awqos,
    AXI3_awvalid => AXI3_awvalid,
    AXI3_awready => AXI3_awready,
    AXI3_wdata => AXI3_wdata,
    AXI3_wstrb => AXI3_wstrb,
    AXI3_wlast => AXI3_wlast,
    AXI3_wvalid => AXI3_wvalid,
    AXI3_wready => AXI3_wready,
    AXI3_bresp => AXI3_bresp,
    AXI3_bvalid => AXI3_bvalid,
    AXI3_bready => AXI3_bready,
    AXI3_araddr => AXI3_araddr,
    AXI3_arlen => AXI3_arlen,
    AXI3_arsize => AXI3_arsize,
    AXI3_arburst => AXI3_arburst,
    AXI3_arlock => AXI3_arlock,
    AXI3_arcache => AXI3_arcache,
    AXI3_arprot => AXI3_arprot,
    AXI3_arqos => AXI3_arqos,
    AXI3_arvalid => AXI3_arvalid,
    AXI3_arready => AXI3_arready,
    AXI3_rdata => AXI3_rdata,
    AXI3_rresp => AXI3_rresp,
    AXI3_rlast => AXI3_rlast,
    AXI3_rvalid => AXI3_rvalid,
    AXI3_rready => AXI3_rready,
    AXI4_awid => AXI4_awid,
    AXI4_awaddr => AXI4_awaddr,
    AXI4_awlen => AXI4_awlen,
    AXI4_awsize => AXI4_awsize,
    AXI4_awburst => AXI4_awburst,
    AXI4_awlock => AXI4_awlock,
    AXI4_awcache => AXI4_awcache,
    AXI4_awprot => AXI4_awprot,
    AXI4_awqos => AXI4_awqos,
    AXI4_awvalid => AXI4_awvalid,
    AXI4_awready => AXI4_awready,
    AXI4_wdata => AXI4_wdata,
    AXI4_wstrb => AXI4_wstrb,
    AXI4_wlast => AXI4_wlast,
    AXI4_wvalid => AXI4_wvalid,
    AXI4_wready => AXI4_wready,
    AXI4_bid => AXI4_bid,
    AXI4_bresp => AXI4_bresp,
    AXI4_bvalid => AXI4_bvalid,
    AXI4_bready => AXI4_bready,
    AXI4_arid => AXI4_arid,
    AXI4_araddr => AXI4_araddr,
    AXI4_arlen => AXI4_arlen,
    AXI4_arsize => AXI4_arsize,
    AXI4_arburst => AXI4_arburst,
    AXI4_arlock => AXI4_arlock,
    AXI4_arcache => AXI4_arcache,
    AXI4_arprot => AXI4_arprot,
    AXI4_arqos => AXI4_arqos,
    AXI4_arvalid => AXI4_arvalid,
    AXI4_arready => AXI4_arready,
    AXI4_rid => AXI4_rid,
    AXI4_rdata => AXI4_rdata,
    AXI4_rresp => AXI4_rresp,
    AXI4_rlast => AXI4_rlast,
    AXI4_rvalid => AXI4_rvalid,
    AXI4_rready => AXI4_rready,
    aclk_250 => aclk_250,
    aclk_450 => aclk_450,
    aresetn_250 => aresetn_250
  );
-- INST_TAG_END ------  End cut for INSTANTIATION Template  ------

-- You must compile the wrapper file cl_axi_sc_1x1.vhd when simulating
-- the module, cl_axi_sc_1x1. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.
