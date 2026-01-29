// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// DO NOT MODIFY THIS FILE.

// MODULE VLNV: amd.com:blockdesign:cl_axi_sc_1x1:1.0

// The following must be inserted into your Verilog file for this
// module to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

// INST_TAG     ------ Begin cut for INSTANTIATION Template ------
cl_axi_sc_1x1 your_instance_name (
  .AXI3_awaddr(AXI3_awaddr), // output wire [63:0] AXI3_awaddr
  .AXI3_awlen(AXI3_awlen), // output wire [3:0] AXI3_awlen
  .AXI3_awsize(AXI3_awsize), // output wire [2:0] AXI3_awsize
  .AXI3_awburst(AXI3_awburst), // output wire [1:0] AXI3_awburst
  .AXI3_awlock(AXI3_awlock), // output wire [1:0] AXI3_awlock
  .AXI3_awcache(AXI3_awcache), // output wire [3:0] AXI3_awcache
  .AXI3_awprot(AXI3_awprot), // output wire [2:0] AXI3_awprot
  .AXI3_awqos(AXI3_awqos), // output wire [3:0] AXI3_awqos
  .AXI3_awvalid(AXI3_awvalid), // output wire AXI3_awvalid
  .AXI3_awready(AXI3_awready), // input wire AXI3_awready
  .AXI3_wdata(AXI3_wdata), // output wire [255:0] AXI3_wdata
  .AXI3_wstrb(AXI3_wstrb), // output wire [31:0] AXI3_wstrb
  .AXI3_wlast(AXI3_wlast), // output wire AXI3_wlast
  .AXI3_wvalid(AXI3_wvalid), // output wire AXI3_wvalid
  .AXI3_wready(AXI3_wready), // input wire AXI3_wready
  .AXI3_bresp(AXI3_bresp), // input wire [1:0] AXI3_bresp
  .AXI3_bvalid(AXI3_bvalid), // input wire AXI3_bvalid
  .AXI3_bready(AXI3_bready), // output wire AXI3_bready
  .AXI3_araddr(AXI3_araddr), // output wire [63:0] AXI3_araddr
  .AXI3_arlen(AXI3_arlen), // output wire [3:0] AXI3_arlen
  .AXI3_arsize(AXI3_arsize), // output wire [2:0] AXI3_arsize
  .AXI3_arburst(AXI3_arburst), // output wire [1:0] AXI3_arburst
  .AXI3_arlock(AXI3_arlock), // output wire [1:0] AXI3_arlock
  .AXI3_arcache(AXI3_arcache), // output wire [3:0] AXI3_arcache
  .AXI3_arprot(AXI3_arprot), // output wire [2:0] AXI3_arprot
  .AXI3_arqos(AXI3_arqos), // output wire [3:0] AXI3_arqos
  .AXI3_arvalid(AXI3_arvalid), // output wire AXI3_arvalid
  .AXI3_arready(AXI3_arready), // input wire AXI3_arready
  .AXI3_rdata(AXI3_rdata), // input wire [255:0] AXI3_rdata
  .AXI3_rresp(AXI3_rresp), // input wire [1:0] AXI3_rresp
  .AXI3_rlast(AXI3_rlast), // input wire AXI3_rlast
  .AXI3_rvalid(AXI3_rvalid), // input wire AXI3_rvalid
  .AXI3_rready(AXI3_rready), // output wire AXI3_rready
  .AXI4_awid(AXI4_awid), // input wire [15:0] AXI4_awid
  .AXI4_awaddr(AXI4_awaddr), // input wire [63:0] AXI4_awaddr
  .AXI4_awlen(AXI4_awlen), // input wire [7:0] AXI4_awlen
  .AXI4_awsize(AXI4_awsize), // input wire [2:0] AXI4_awsize
  .AXI4_awburst(AXI4_awburst), // input wire [1:0] AXI4_awburst
  .AXI4_awlock(AXI4_awlock), // input wire [0:0] AXI4_awlock
  .AXI4_awcache(AXI4_awcache), // input wire [3:0] AXI4_awcache
  .AXI4_awprot(AXI4_awprot), // input wire [2:0] AXI4_awprot
  .AXI4_awqos(AXI4_awqos), // input wire [3:0] AXI4_awqos
  .AXI4_awvalid(AXI4_awvalid), // input wire AXI4_awvalid
  .AXI4_awready(AXI4_awready), // output wire AXI4_awready
  .AXI4_wdata(AXI4_wdata), // input wire [511:0] AXI4_wdata
  .AXI4_wstrb(AXI4_wstrb), // input wire [63:0] AXI4_wstrb
  .AXI4_wlast(AXI4_wlast), // input wire AXI4_wlast
  .AXI4_wvalid(AXI4_wvalid), // input wire AXI4_wvalid
  .AXI4_wready(AXI4_wready), // output wire AXI4_wready
  .AXI4_bid(AXI4_bid), // output wire [15:0] AXI4_bid
  .AXI4_bresp(AXI4_bresp), // output wire [1:0] AXI4_bresp
  .AXI4_bvalid(AXI4_bvalid), // output wire AXI4_bvalid
  .AXI4_bready(AXI4_bready), // input wire AXI4_bready
  .AXI4_arid(AXI4_arid), // input wire [15:0] AXI4_arid
  .AXI4_araddr(AXI4_araddr), // input wire [63:0] AXI4_araddr
  .AXI4_arlen(AXI4_arlen), // input wire [7:0] AXI4_arlen
  .AXI4_arsize(AXI4_arsize), // input wire [2:0] AXI4_arsize
  .AXI4_arburst(AXI4_arburst), // input wire [1:0] AXI4_arburst
  .AXI4_arlock(AXI4_arlock), // input wire [0:0] AXI4_arlock
  .AXI4_arcache(AXI4_arcache), // input wire [3:0] AXI4_arcache
  .AXI4_arprot(AXI4_arprot), // input wire [2:0] AXI4_arprot
  .AXI4_arqos(AXI4_arqos), // input wire [3:0] AXI4_arqos
  .AXI4_arvalid(AXI4_arvalid), // input wire AXI4_arvalid
  .AXI4_arready(AXI4_arready), // output wire AXI4_arready
  .AXI4_rid(AXI4_rid), // output wire [15:0] AXI4_rid
  .AXI4_rdata(AXI4_rdata), // output wire [511:0] AXI4_rdata
  .AXI4_rresp(AXI4_rresp), // output wire [1:0] AXI4_rresp
  .AXI4_rlast(AXI4_rlast), // output wire AXI4_rlast
  .AXI4_rvalid(AXI4_rvalid), // output wire AXI4_rvalid
  .AXI4_rready(AXI4_rready), // input wire AXI4_rready
  .aclk_250(aclk_250), // input wire aclk_250
  .aclk_450(aclk_450), // input wire aclk_450
  .aresetn_250(aresetn_250) // input wire aresetn_250
);
// INST_TAG_END ------  End cut for INSTANTIATION Template  ------

// You must compile the wrapper file cl_axi_sc_1x1.v when simulating
// the module, cl_axi_sc_1x1. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.
