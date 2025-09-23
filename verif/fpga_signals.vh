// ============================================================================
// Amazon FPGA Hardware Development Kit
//
// Copyright 2025 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License"). You may not use
// this file except in compliance with the License. A copy of the License is
// located at
//
//    http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
// implied. See the License for the specific language governing permissions and
// limitations under the License.
// ============================================================================

//------------------------------------------------------------------------------
// GENERATED FILE. DO NOT MODIFY!
//------------------------------------------------------------------------------
   logic                 clk_main_a0;
   logic                 rst_main_n;
   logic                 clk_hbm_ref;
   logic                 sh_cl_flr_assert;
   logic                 cl_sh_flr_done;
   logic        [31:0]   cl_sh_status0;
   logic        [31:0]   cl_sh_status1;
   logic        [31:0]   cl_sh_status2;
   logic        [31:0]   cl_sh_id0;
   logic        [31:0]   cl_sh_id1;
   logic        [31:0]   sh_cl_ctl0;
   logic        [31:0]   sh_cl_ctl1;
   logic        [31:0]   sh_cl_ctl2;
   logic        [15:0]   sh_cl_status_vdip;
   logic        [15:0]   cl_sh_status_vled;
   logic        [1:0]    sh_cl_pwr_state;
   logic                 cl_sh_dma_wr_full;
   logic                 cl_sh_dma_rd_full;
   logic        [15:0]   cl_sh_pcim_awid;
   logic        [63:0]   cl_sh_pcim_awaddr;
   logic        [7:0]    cl_sh_pcim_awlen;
   logic        [2:0]    cl_sh_pcim_awsize;
   logic        [1:0]    cl_sh_pcim_awburst;
   logic        [3:0]    cl_sh_pcim_awcache;
   logic                 cl_sh_pcim_awlock;
   logic        [2:0]    cl_sh_pcim_awprot;
   logic        [3:0]    cl_sh_pcim_awqos;
   logic        [54:0]   cl_sh_pcim_awuser;
   logic                 cl_sh_pcim_awvalid;
   logic                 sh_cl_pcim_awready;
   logic        [15:0]   cl_sh_pcim_wid;
   logic        [511:0]  cl_sh_pcim_wdata;
   logic        [63:0]   cl_sh_pcim_wstrb;
   logic                 cl_sh_pcim_wlast;
   logic        [63:0]   cl_sh_pcim_wuser;
   logic                 cl_sh_pcim_wvalid;
   logic                 sh_cl_pcim_wready;
   logic        [15:0]   sh_cl_pcim_bid;
   logic        [1:0]    sh_cl_pcim_bresp;
   logic                 sh_cl_pcim_bvalid;
   logic                 cl_sh_pcim_bready;
   logic        [15:0]   cl_sh_pcim_arid;
   logic        [63:0]   cl_sh_pcim_araddr;
   logic        [7:0]    cl_sh_pcim_arlen;
   logic        [2:0]    cl_sh_pcim_arsize;
   logic        [1:0]    cl_sh_pcim_arburst;
   logic        [3:0]    cl_sh_pcim_arcache;
   logic                 cl_sh_pcim_arlock;
   logic        [2:0]    cl_sh_pcim_arprot;
   logic        [3:0]    cl_sh_pcim_arqos;
   logic        [54:0]   cl_sh_pcim_aruser;
   logic                 cl_sh_pcim_arvalid;
   logic                 sh_cl_pcim_arready;
   logic        [15:0]   sh_cl_pcim_rid;
   logic        [511:0]  sh_cl_pcim_rdata;
   logic        [1:0]    sh_cl_pcim_rresp;
   logic                 sh_cl_pcim_rlast;
   logic        [63:0]   sh_cl_pcim_ruser;
   logic                 sh_cl_pcim_rvalid;
   logic                 cl_sh_pcim_rready;
   logic        [1:0]    cfg_max_payload;
   logic        [2:0]    cfg_max_read_req;
   logic        [7:0]    sh_cl_ddr_stat_addr;
   logic        [31:0]   sh_cl_ddr_stat_wdata;
   logic                 sh_cl_ddr_stat_wr;
   logic                 sh_cl_ddr_stat_rd;
   logic        [2:0]    sh_cl_ddr_stat_user;
   logic                 cl_sh_ddr_stat_ack;
   logic        [31:0]   cl_sh_ddr_stat_rdata;
   logic        [7:0]    cl_sh_ddr_stat_int;
   logic        [15:0]   cl_sh_apppf_irq_req;
   logic        [15:0]   sh_cl_apppf_irq_ack;
   logic        [15:0]   sh_cl_dma_pcis_awid;
   logic        [63:0]   sh_cl_dma_pcis_awaddr;
   logic        [7:0]    sh_cl_dma_pcis_awlen;
   logic        [2:0]    sh_cl_dma_pcis_awsize;
   logic        [1:0]    sh_cl_dma_pcis_awburst;
   logic        [3:0]    sh_cl_dma_pcis_awcache;
   logic                 sh_cl_dma_pcis_awlock;
   logic        [2:0]    sh_cl_dma_pcis_awprot;
   logic        [3:0]    sh_cl_dma_pcis_awqos;
   logic        [54:0]   sh_cl_dma_pcis_awuser;
   logic                 sh_cl_dma_pcis_awvalid;
   logic                 cl_sh_dma_pcis_awready;
   logic        [15:0]   sh_cl_dma_pcis_wid;
   logic        [511:0]  sh_cl_dma_pcis_wdata;
   logic        [63:0]   sh_cl_dma_pcis_wstrb;
   logic                 sh_cl_dma_pcis_wlast;
   logic        [63:0]   sh_cl_dma_pcis_wuser;
   logic                 sh_cl_dma_pcis_wvalid;
   logic                 cl_sh_dma_pcis_wready;
   logic        [15:0]   cl_sh_dma_pcis_bid;
   logic        [1:0]    cl_sh_dma_pcis_bresp;
   logic                 cl_sh_dma_pcis_bvalid;
   logic                 sh_cl_dma_pcis_bready;
   logic        [15:0]   sh_cl_dma_pcis_arid;
   logic        [63:0]   sh_cl_dma_pcis_araddr;
   logic        [7:0]    sh_cl_dma_pcis_arlen;
   logic        [2:0]    sh_cl_dma_pcis_arsize;
   logic        [1:0]    sh_cl_dma_pcis_arburst;
   logic        [3:0]    sh_cl_dma_pcis_arcache;
   logic                 sh_cl_dma_pcis_arlock;
   logic        [2:0]    sh_cl_dma_pcis_arprot;
   logic        [3:0]    sh_cl_dma_pcis_arqos;
   logic        [54:0]   sh_cl_dma_pcis_aruser;
   logic                 sh_cl_dma_pcis_arvalid;
   logic                 cl_sh_dma_pcis_arready;
   logic        [15:0]   cl_sh_dma_pcis_rid;
   logic        [511:0]  cl_sh_dma_pcis_rdata;
   logic        [1:0]    cl_sh_dma_pcis_rresp;
   logic                 cl_sh_dma_pcis_rlast;
   logic        [63:0]   cl_sh_dma_pcis_ruser;
   logic                 cl_sh_dma_pcis_rvalid;
   logic                 sh_cl_dma_pcis_rready;
   logic        [31:0]   ocl_cl_awaddr;
   logic        [54:0]   ocl_cl_awuser;
   logic                 ocl_cl_awvalid;
   logic                 cl_ocl_awready;
   logic        [31:0]   ocl_cl_wdata;
   logic        [3:0]    ocl_cl_wstrb;
   logic                 ocl_cl_wvalid;
   logic                 cl_ocl_wready;
   logic        [1:0]    cl_ocl_bresp;
   logic                 cl_ocl_bvalid;
   logic                 ocl_cl_bready;
   logic        [31:0]   ocl_cl_araddr;
   logic        [54:0]   ocl_cl_aruser;
   logic                 ocl_cl_arvalid;
   logic                 cl_ocl_arready;
   logic        [31:0]   cl_ocl_rdata;
   logic        [1:0]    cl_ocl_rresp;
   logic                 cl_ocl_rvalid;
   logic                 ocl_cl_rready;
   logic        [31:0]   sda_cl_awaddr;
   logic                 sda_cl_awvalid;
   logic                 cl_sda_awready;
   logic        [31:0]   sda_cl_wdata;
   logic        [3:0]    sda_cl_wstrb;
   logic                 sda_cl_wvalid;
   logic                 cl_sda_wready;
   logic        [1:0]    cl_sda_bresp;
   logic                 cl_sda_bvalid;
   logic                 sda_cl_bready;
   logic        [31:0]   sda_cl_araddr;
   logic                 sda_cl_arvalid;
   logic                 cl_sda_arready;
   logic        [31:0]   cl_sda_rdata;
   logic        [1:0]    cl_sda_rresp;
   logic                 cl_sda_rvalid;
   logic                 sda_cl_rready;
   logic                 drck;
   logic                 shift;
   logic                 tdi;
   logic                 update;
   logic                 sel;
   logic                 tdo;
   logic                 tms;
   logic                 tck;
   logic                 runtest;
   logic                 reset;
   logic                 capture;
   logic                 bscanid_en;
   logic        [63:0]   sh_cl_glcount0;
   logic        [63:0]   sh_cl_glcount1;
   logic                 hbm_apb_preset_n_1;
   logic        [21:0]   hbm_apb_paddr_1;
   logic        [2:0]    hbm_apb_pprot_1;
   logic                 hbm_apb_psel_1;
   logic                 hbm_apb_penable_1;
   logic                 hbm_apb_pwrite_1;
   logic        [31:0]   hbm_apb_pwdata_1;
   logic        [3:0]    hbm_apb_pstrb_1;
   logic                 hbm_apb_pready_1;
   logic        [31:0]   hbm_apb_prdata_1;
   logic                 hbm_apb_pslverr_1;
   logic                 hbm_apb_preset_n_0;
   logic        [21:0]   hbm_apb_paddr_0;
   logic        [2:0]    hbm_apb_pprot_0;
   logic                 hbm_apb_psel_0;
   logic                 hbm_apb_penable_0;
   logic                 hbm_apb_pwrite_0;
   logic        [31:0]   hbm_apb_pwdata_0;
   logic        [3:0]    hbm_apb_pstrb_0;
   logic                 hbm_apb_pready_0;
   logic        [31:0]   hbm_apb_prdata_0;
   logic                 hbm_apb_pslverr_0;
