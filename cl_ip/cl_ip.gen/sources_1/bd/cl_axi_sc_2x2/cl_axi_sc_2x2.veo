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

// MODULE VLNV: amd.com:blockdesign:cl_axi_sc_2x2:1.0

// The following must be inserted into your Verilog file for this
// module to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

// INST_TAG     ------ Begin cut for INSTANTIATION Template ------
cl_axi_sc_2x2 your_instance_name (
  .ATG_awid(ATG_awid), // input wire [15:0] ATG_awid
  .ATG_awaddr(ATG_awaddr), // input wire [63:0] ATG_awaddr
  .ATG_awlen(ATG_awlen), // input wire [7:0] ATG_awlen
  .ATG_awsize(ATG_awsize), // input wire [2:0] ATG_awsize
  .ATG_awburst(ATG_awburst), // input wire [1:0] ATG_awburst
  .ATG_awlock(ATG_awlock), // input wire [0:0] ATG_awlock
  .ATG_awcache(ATG_awcache), // input wire [3:0] ATG_awcache
  .ATG_awprot(ATG_awprot), // input wire [2:0] ATG_awprot
  .ATG_awqos(ATG_awqos), // input wire [3:0] ATG_awqos
  .ATG_awvalid(ATG_awvalid), // input wire ATG_awvalid
  .ATG_awready(ATG_awready), // output wire ATG_awready
  .ATG_wdata(ATG_wdata), // input wire [511:0] ATG_wdata
  .ATG_wstrb(ATG_wstrb), // input wire [63:0] ATG_wstrb
  .ATG_wlast(ATG_wlast), // input wire ATG_wlast
  .ATG_wvalid(ATG_wvalid), // input wire ATG_wvalid
  .ATG_wready(ATG_wready), // output wire ATG_wready
  .ATG_bid(ATG_bid), // output wire [15:0] ATG_bid
  .ATG_bresp(ATG_bresp), // output wire [1:0] ATG_bresp
  .ATG_bvalid(ATG_bvalid), // output wire ATG_bvalid
  .ATG_bready(ATG_bready), // input wire ATG_bready
  .ATG_arid(ATG_arid), // input wire [15:0] ATG_arid
  .ATG_araddr(ATG_araddr), // input wire [63:0] ATG_araddr
  .ATG_arlen(ATG_arlen), // input wire [7:0] ATG_arlen
  .ATG_arsize(ATG_arsize), // input wire [2:0] ATG_arsize
  .ATG_arburst(ATG_arburst), // input wire [1:0] ATG_arburst
  .ATG_arlock(ATG_arlock), // input wire [0:0] ATG_arlock
  .ATG_arcache(ATG_arcache), // input wire [3:0] ATG_arcache
  .ATG_arprot(ATG_arprot), // input wire [2:0] ATG_arprot
  .ATG_arqos(ATG_arqos), // input wire [3:0] ATG_arqos
  .ATG_arvalid(ATG_arvalid), // input wire ATG_arvalid
  .ATG_arready(ATG_arready), // output wire ATG_arready
  .ATG_rid(ATG_rid), // output wire [15:0] ATG_rid
  .ATG_rdata(ATG_rdata), // output wire [511:0] ATG_rdata
  .ATG_rresp(ATG_rresp), // output wire [1:0] ATG_rresp
  .ATG_rlast(ATG_rlast), // output wire ATG_rlast
  .ATG_rvalid(ATG_rvalid), // output wire ATG_rvalid
  .ATG_rready(ATG_rready), // input wire ATG_rready
  .DDRA_awaddr(DDRA_awaddr), // output wire [63:0] DDRA_awaddr
  .DDRA_awlen(DDRA_awlen), // output wire [7:0] DDRA_awlen
  .DDRA_awsize(DDRA_awsize), // output wire [2:0] DDRA_awsize
  .DDRA_awburst(DDRA_awburst), // output wire [1:0] DDRA_awburst
  .DDRA_awlock(DDRA_awlock), // output wire [0:0] DDRA_awlock
  .DDRA_awcache(DDRA_awcache), // output wire [3:0] DDRA_awcache
  .DDRA_awprot(DDRA_awprot), // output wire [2:0] DDRA_awprot
  .DDRA_awqos(DDRA_awqos), // output wire [3:0] DDRA_awqos
  .DDRA_awvalid(DDRA_awvalid), // output wire DDRA_awvalid
  .DDRA_awready(DDRA_awready), // input wire DDRA_awready
  .DDRA_wdata(DDRA_wdata), // output wire [511:0] DDRA_wdata
  .DDRA_wstrb(DDRA_wstrb), // output wire [63:0] DDRA_wstrb
  .DDRA_wlast(DDRA_wlast), // output wire DDRA_wlast
  .DDRA_wvalid(DDRA_wvalid), // output wire DDRA_wvalid
  .DDRA_wready(DDRA_wready), // input wire DDRA_wready
  .DDRA_bresp(DDRA_bresp), // input wire [1:0] DDRA_bresp
  .DDRA_bvalid(DDRA_bvalid), // input wire DDRA_bvalid
  .DDRA_bready(DDRA_bready), // output wire DDRA_bready
  .DDRA_araddr(DDRA_araddr), // output wire [63:0] DDRA_araddr
  .DDRA_arlen(DDRA_arlen), // output wire [7:0] DDRA_arlen
  .DDRA_arsize(DDRA_arsize), // output wire [2:0] DDRA_arsize
  .DDRA_arburst(DDRA_arburst), // output wire [1:0] DDRA_arburst
  .DDRA_arlock(DDRA_arlock), // output wire [0:0] DDRA_arlock
  .DDRA_arcache(DDRA_arcache), // output wire [3:0] DDRA_arcache
  .DDRA_arprot(DDRA_arprot), // output wire [2:0] DDRA_arprot
  .DDRA_arqos(DDRA_arqos), // output wire [3:0] DDRA_arqos
  .DDRA_arvalid(DDRA_arvalid), // output wire DDRA_arvalid
  .DDRA_arready(DDRA_arready), // input wire DDRA_arready
  .DDRA_rdata(DDRA_rdata), // input wire [511:0] DDRA_rdata
  .DDRA_rresp(DDRA_rresp), // input wire [1:0] DDRA_rresp
  .DDRA_rlast(DDRA_rlast), // input wire DDRA_rlast
  .DDRA_rvalid(DDRA_rvalid), // input wire DDRA_rvalid
  .DDRA_rready(DDRA_rready), // output wire DDRA_rready
  .DDRB_awaddr(DDRB_awaddr), // output wire [63:0] DDRB_awaddr
  .DDRB_awlen(DDRB_awlen), // output wire [7:0] DDRB_awlen
  .DDRB_awsize(DDRB_awsize), // output wire [2:0] DDRB_awsize
  .DDRB_awburst(DDRB_awburst), // output wire [1:0] DDRB_awburst
  .DDRB_awlock(DDRB_awlock), // output wire [0:0] DDRB_awlock
  .DDRB_awcache(DDRB_awcache), // output wire [3:0] DDRB_awcache
  .DDRB_awprot(DDRB_awprot), // output wire [2:0] DDRB_awprot
  .DDRB_awqos(DDRB_awqos), // output wire [3:0] DDRB_awqos
  .DDRB_awvalid(DDRB_awvalid), // output wire DDRB_awvalid
  .DDRB_awready(DDRB_awready), // input wire DDRB_awready
  .DDRB_wdata(DDRB_wdata), // output wire [511:0] DDRB_wdata
  .DDRB_wstrb(DDRB_wstrb), // output wire [63:0] DDRB_wstrb
  .DDRB_wlast(DDRB_wlast), // output wire DDRB_wlast
  .DDRB_wvalid(DDRB_wvalid), // output wire DDRB_wvalid
  .DDRB_wready(DDRB_wready), // input wire DDRB_wready
  .DDRB_bresp(DDRB_bresp), // input wire [1:0] DDRB_bresp
  .DDRB_bvalid(DDRB_bvalid), // input wire DDRB_bvalid
  .DDRB_bready(DDRB_bready), // output wire DDRB_bready
  .DDRB_araddr(DDRB_araddr), // output wire [63:0] DDRB_araddr
  .DDRB_arlen(DDRB_arlen), // output wire [7:0] DDRB_arlen
  .DDRB_arsize(DDRB_arsize), // output wire [2:0] DDRB_arsize
  .DDRB_arburst(DDRB_arburst), // output wire [1:0] DDRB_arburst
  .DDRB_arlock(DDRB_arlock), // output wire [0:0] DDRB_arlock
  .DDRB_arcache(DDRB_arcache), // output wire [3:0] DDRB_arcache
  .DDRB_arprot(DDRB_arprot), // output wire [2:0] DDRB_arprot
  .DDRB_arqos(DDRB_arqos), // output wire [3:0] DDRB_arqos
  .DDRB_arvalid(DDRB_arvalid), // output wire DDRB_arvalid
  .DDRB_arready(DDRB_arready), // input wire DDRB_arready
  .DDRB_rdata(DDRB_rdata), // input wire [511:0] DDRB_rdata
  .DDRB_rresp(DDRB_rresp), // input wire [1:0] DDRB_rresp
  .DDRB_rlast(DDRB_rlast), // input wire DDRB_rlast
  .DDRB_rvalid(DDRB_rvalid), // input wire DDRB_rvalid
  .DDRB_rready(DDRB_rready), // output wire DDRB_rready
  .XDMA_awid(XDMA_awid), // input wire [15:0] XDMA_awid
  .XDMA_awaddr(XDMA_awaddr), // input wire [63:0] XDMA_awaddr
  .XDMA_awlen(XDMA_awlen), // input wire [7:0] XDMA_awlen
  .XDMA_awsize(XDMA_awsize), // input wire [2:0] XDMA_awsize
  .XDMA_awburst(XDMA_awburst), // input wire [1:0] XDMA_awburst
  .XDMA_awlock(XDMA_awlock), // input wire [0:0] XDMA_awlock
  .XDMA_awcache(XDMA_awcache), // input wire [3:0] XDMA_awcache
  .XDMA_awprot(XDMA_awprot), // input wire [2:0] XDMA_awprot
  .XDMA_awqos(XDMA_awqos), // input wire [3:0] XDMA_awqos
  .XDMA_awvalid(XDMA_awvalid), // input wire XDMA_awvalid
  .XDMA_awready(XDMA_awready), // output wire XDMA_awready
  .XDMA_wdata(XDMA_wdata), // input wire [511:0] XDMA_wdata
  .XDMA_wstrb(XDMA_wstrb), // input wire [63:0] XDMA_wstrb
  .XDMA_wlast(XDMA_wlast), // input wire XDMA_wlast
  .XDMA_wvalid(XDMA_wvalid), // input wire XDMA_wvalid
  .XDMA_wready(XDMA_wready), // output wire XDMA_wready
  .XDMA_bid(XDMA_bid), // output wire [15:0] XDMA_bid
  .XDMA_bresp(XDMA_bresp), // output wire [1:0] XDMA_bresp
  .XDMA_bvalid(XDMA_bvalid), // output wire XDMA_bvalid
  .XDMA_bready(XDMA_bready), // input wire XDMA_bready
  .XDMA_arid(XDMA_arid), // input wire [15:0] XDMA_arid
  .XDMA_araddr(XDMA_araddr), // input wire [63:0] XDMA_araddr
  .XDMA_arlen(XDMA_arlen), // input wire [7:0] XDMA_arlen
  .XDMA_arsize(XDMA_arsize), // input wire [2:0] XDMA_arsize
  .XDMA_arburst(XDMA_arburst), // input wire [1:0] XDMA_arburst
  .XDMA_arlock(XDMA_arlock), // input wire [0:0] XDMA_arlock
  .XDMA_arcache(XDMA_arcache), // input wire [3:0] XDMA_arcache
  .XDMA_arprot(XDMA_arprot), // input wire [2:0] XDMA_arprot
  .XDMA_arqos(XDMA_arqos), // input wire [3:0] XDMA_arqos
  .XDMA_arvalid(XDMA_arvalid), // input wire XDMA_arvalid
  .XDMA_arready(XDMA_arready), // output wire XDMA_arready
  .XDMA_rid(XDMA_rid), // output wire [15:0] XDMA_rid
  .XDMA_rdata(XDMA_rdata), // output wire [511:0] XDMA_rdata
  .XDMA_rresp(XDMA_rresp), // output wire [1:0] XDMA_rresp
  .XDMA_rlast(XDMA_rlast), // output wire XDMA_rlast
  .XDMA_rvalid(XDMA_rvalid), // output wire XDMA_rvalid
  .XDMA_rready(XDMA_rready), // input wire XDMA_rready
  .aclk_250(aclk_250), // input wire aclk_250
  .aresetn_250(aresetn_250) // input wire aresetn_250
);
// INST_TAG_END ------  End cut for INSTANTIATION Template  ------

// You must compile the wrapper file cl_axi_sc_2x2.v when simulating
// the module, cl_axi_sc_2x2. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.
