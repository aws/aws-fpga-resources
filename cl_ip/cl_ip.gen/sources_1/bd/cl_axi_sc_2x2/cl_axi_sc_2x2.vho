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

-- MODULE VLNV: amd.com:blockdesign:cl_axi_sc_2x2:1.0

-- The following code must appear in the VHDL architecture header.

-- COMP_TAG     ------ Begin cut for COMPONENT Declaration ------
COMPONENT cl_axi_sc_2x2
  PORT (
    ATG_awid : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    ATG_awaddr : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    ATG_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    ATG_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    ATG_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    ATG_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    ATG_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    ATG_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    ATG_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    ATG_awvalid : IN STD_LOGIC;
    ATG_awready : OUT STD_LOGIC;
    ATG_wdata : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    ATG_wstrb : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    ATG_wlast : IN STD_LOGIC;
    ATG_wvalid : IN STD_LOGIC;
    ATG_wready : OUT STD_LOGIC;
    ATG_bid : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ATG_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ATG_bvalid : OUT STD_LOGIC;
    ATG_bready : IN STD_LOGIC;
    ATG_arid : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    ATG_araddr : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    ATG_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    ATG_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    ATG_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    ATG_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    ATG_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    ATG_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    ATG_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    ATG_arvalid : IN STD_LOGIC;
    ATG_arready : OUT STD_LOGIC;
    ATG_rid : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ATG_rdata : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    ATG_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ATG_rlast : OUT STD_LOGIC;
    ATG_rvalid : OUT STD_LOGIC;
    ATG_rready : IN STD_LOGIC;
    DDRA_awaddr : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    DDRA_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DDRA_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DDRA_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    DDRA_awlock : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    DDRA_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDRA_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DDRA_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDRA_awvalid : OUT STD_LOGIC;
    DDRA_awready : IN STD_LOGIC;
    DDRA_wdata : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    DDRA_wstrb : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    DDRA_wlast : OUT STD_LOGIC;
    DDRA_wvalid : OUT STD_LOGIC;
    DDRA_wready : IN STD_LOGIC;
    DDRA_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    DDRA_bvalid : IN STD_LOGIC;
    DDRA_bready : OUT STD_LOGIC;
    DDRA_araddr : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    DDRA_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DDRA_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DDRA_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    DDRA_arlock : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    DDRA_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDRA_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DDRA_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDRA_arvalid : OUT STD_LOGIC;
    DDRA_arready : IN STD_LOGIC;
    DDRA_rdata : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    DDRA_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    DDRA_rlast : IN STD_LOGIC;
    DDRA_rvalid : IN STD_LOGIC;
    DDRA_rready : OUT STD_LOGIC;
    DDRB_awaddr : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    DDRB_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DDRB_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DDRB_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    DDRB_awlock : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    DDRB_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDRB_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DDRB_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDRB_awvalid : OUT STD_LOGIC;
    DDRB_awready : IN STD_LOGIC;
    DDRB_wdata : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    DDRB_wstrb : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    DDRB_wlast : OUT STD_LOGIC;
    DDRB_wvalid : OUT STD_LOGIC;
    DDRB_wready : IN STD_LOGIC;
    DDRB_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    DDRB_bvalid : IN STD_LOGIC;
    DDRB_bready : OUT STD_LOGIC;
    DDRB_araddr : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    DDRB_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DDRB_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DDRB_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    DDRB_arlock : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    DDRB_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDRB_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DDRB_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDRB_arvalid : OUT STD_LOGIC;
    DDRB_arready : IN STD_LOGIC;
    DDRB_rdata : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    DDRB_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    DDRB_rlast : IN STD_LOGIC;
    DDRB_rvalid : IN STD_LOGIC;
    DDRB_rready : OUT STD_LOGIC;
    XDMA_awid : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    XDMA_awaddr : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    XDMA_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    XDMA_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    XDMA_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    XDMA_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    XDMA_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    XDMA_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    XDMA_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    XDMA_awvalid : IN STD_LOGIC;
    XDMA_awready : OUT STD_LOGIC;
    XDMA_wdata : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    XDMA_wstrb : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    XDMA_wlast : IN STD_LOGIC;
    XDMA_wvalid : IN STD_LOGIC;
    XDMA_wready : OUT STD_LOGIC;
    XDMA_bid : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    XDMA_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    XDMA_bvalid : OUT STD_LOGIC;
    XDMA_bready : IN STD_LOGIC;
    XDMA_arid : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    XDMA_araddr : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    XDMA_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    XDMA_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    XDMA_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    XDMA_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    XDMA_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    XDMA_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    XDMA_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    XDMA_arvalid : IN STD_LOGIC;
    XDMA_arready : OUT STD_LOGIC;
    XDMA_rid : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    XDMA_rdata : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    XDMA_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    XDMA_rlast : OUT STD_LOGIC;
    XDMA_rvalid : OUT STD_LOGIC;
    XDMA_rready : IN STD_LOGIC;
    aclk_250 : IN STD_LOGIC;
    aresetn_250 : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------  End cut for COMPONENT Declaration  ------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

-- INST_TAG     ------ Begin cut for INSTANTIATION Template ------
your_instance_name : cl_axi_sc_2x2
  PORT MAP (
    ATG_awid => ATG_awid,
    ATG_awaddr => ATG_awaddr,
    ATG_awlen => ATG_awlen,
    ATG_awsize => ATG_awsize,
    ATG_awburst => ATG_awburst,
    ATG_awlock => ATG_awlock,
    ATG_awcache => ATG_awcache,
    ATG_awprot => ATG_awprot,
    ATG_awqos => ATG_awqos,
    ATG_awvalid => ATG_awvalid,
    ATG_awready => ATG_awready,
    ATG_wdata => ATG_wdata,
    ATG_wstrb => ATG_wstrb,
    ATG_wlast => ATG_wlast,
    ATG_wvalid => ATG_wvalid,
    ATG_wready => ATG_wready,
    ATG_bid => ATG_bid,
    ATG_bresp => ATG_bresp,
    ATG_bvalid => ATG_bvalid,
    ATG_bready => ATG_bready,
    ATG_arid => ATG_arid,
    ATG_araddr => ATG_araddr,
    ATG_arlen => ATG_arlen,
    ATG_arsize => ATG_arsize,
    ATG_arburst => ATG_arburst,
    ATG_arlock => ATG_arlock,
    ATG_arcache => ATG_arcache,
    ATG_arprot => ATG_arprot,
    ATG_arqos => ATG_arqos,
    ATG_arvalid => ATG_arvalid,
    ATG_arready => ATG_arready,
    ATG_rid => ATG_rid,
    ATG_rdata => ATG_rdata,
    ATG_rresp => ATG_rresp,
    ATG_rlast => ATG_rlast,
    ATG_rvalid => ATG_rvalid,
    ATG_rready => ATG_rready,
    DDRA_awaddr => DDRA_awaddr,
    DDRA_awlen => DDRA_awlen,
    DDRA_awsize => DDRA_awsize,
    DDRA_awburst => DDRA_awburst,
    DDRA_awlock => DDRA_awlock,
    DDRA_awcache => DDRA_awcache,
    DDRA_awprot => DDRA_awprot,
    DDRA_awqos => DDRA_awqos,
    DDRA_awvalid => DDRA_awvalid,
    DDRA_awready => DDRA_awready,
    DDRA_wdata => DDRA_wdata,
    DDRA_wstrb => DDRA_wstrb,
    DDRA_wlast => DDRA_wlast,
    DDRA_wvalid => DDRA_wvalid,
    DDRA_wready => DDRA_wready,
    DDRA_bresp => DDRA_bresp,
    DDRA_bvalid => DDRA_bvalid,
    DDRA_bready => DDRA_bready,
    DDRA_araddr => DDRA_araddr,
    DDRA_arlen => DDRA_arlen,
    DDRA_arsize => DDRA_arsize,
    DDRA_arburst => DDRA_arburst,
    DDRA_arlock => DDRA_arlock,
    DDRA_arcache => DDRA_arcache,
    DDRA_arprot => DDRA_arprot,
    DDRA_arqos => DDRA_arqos,
    DDRA_arvalid => DDRA_arvalid,
    DDRA_arready => DDRA_arready,
    DDRA_rdata => DDRA_rdata,
    DDRA_rresp => DDRA_rresp,
    DDRA_rlast => DDRA_rlast,
    DDRA_rvalid => DDRA_rvalid,
    DDRA_rready => DDRA_rready,
    DDRB_awaddr => DDRB_awaddr,
    DDRB_awlen => DDRB_awlen,
    DDRB_awsize => DDRB_awsize,
    DDRB_awburst => DDRB_awburst,
    DDRB_awlock => DDRB_awlock,
    DDRB_awcache => DDRB_awcache,
    DDRB_awprot => DDRB_awprot,
    DDRB_awqos => DDRB_awqos,
    DDRB_awvalid => DDRB_awvalid,
    DDRB_awready => DDRB_awready,
    DDRB_wdata => DDRB_wdata,
    DDRB_wstrb => DDRB_wstrb,
    DDRB_wlast => DDRB_wlast,
    DDRB_wvalid => DDRB_wvalid,
    DDRB_wready => DDRB_wready,
    DDRB_bresp => DDRB_bresp,
    DDRB_bvalid => DDRB_bvalid,
    DDRB_bready => DDRB_bready,
    DDRB_araddr => DDRB_araddr,
    DDRB_arlen => DDRB_arlen,
    DDRB_arsize => DDRB_arsize,
    DDRB_arburst => DDRB_arburst,
    DDRB_arlock => DDRB_arlock,
    DDRB_arcache => DDRB_arcache,
    DDRB_arprot => DDRB_arprot,
    DDRB_arqos => DDRB_arqos,
    DDRB_arvalid => DDRB_arvalid,
    DDRB_arready => DDRB_arready,
    DDRB_rdata => DDRB_rdata,
    DDRB_rresp => DDRB_rresp,
    DDRB_rlast => DDRB_rlast,
    DDRB_rvalid => DDRB_rvalid,
    DDRB_rready => DDRB_rready,
    XDMA_awid => XDMA_awid,
    XDMA_awaddr => XDMA_awaddr,
    XDMA_awlen => XDMA_awlen,
    XDMA_awsize => XDMA_awsize,
    XDMA_awburst => XDMA_awburst,
    XDMA_awlock => XDMA_awlock,
    XDMA_awcache => XDMA_awcache,
    XDMA_awprot => XDMA_awprot,
    XDMA_awqos => XDMA_awqos,
    XDMA_awvalid => XDMA_awvalid,
    XDMA_awready => XDMA_awready,
    XDMA_wdata => XDMA_wdata,
    XDMA_wstrb => XDMA_wstrb,
    XDMA_wlast => XDMA_wlast,
    XDMA_wvalid => XDMA_wvalid,
    XDMA_wready => XDMA_wready,
    XDMA_bid => XDMA_bid,
    XDMA_bresp => XDMA_bresp,
    XDMA_bvalid => XDMA_bvalid,
    XDMA_bready => XDMA_bready,
    XDMA_arid => XDMA_arid,
    XDMA_araddr => XDMA_araddr,
    XDMA_arlen => XDMA_arlen,
    XDMA_arsize => XDMA_arsize,
    XDMA_arburst => XDMA_arburst,
    XDMA_arlock => XDMA_arlock,
    XDMA_arcache => XDMA_arcache,
    XDMA_arprot => XDMA_arprot,
    XDMA_arqos => XDMA_arqos,
    XDMA_arvalid => XDMA_arvalid,
    XDMA_arready => XDMA_arready,
    XDMA_rid => XDMA_rid,
    XDMA_rdata => XDMA_rdata,
    XDMA_rresp => XDMA_rresp,
    XDMA_rlast => XDMA_rlast,
    XDMA_rvalid => XDMA_rvalid,
    XDMA_rready => XDMA_rready,
    aclk_250 => aclk_250,
    aresetn_250 => aresetn_250
  );
-- INST_TAG_END ------  End cut for INSTANTIATION Template  ------

-- You must compile the wrapper file cl_axi_sc_2x2.vhd when simulating
-- the module, cl_axi_sc_2x2. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.
