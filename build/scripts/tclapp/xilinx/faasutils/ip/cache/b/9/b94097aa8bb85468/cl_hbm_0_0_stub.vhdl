-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue Aug 26 15:47:50 2025
-- Host        : rl8-x2iedn-32xl-0 running 64-bit Rocky Linux release 8.10 (Green Obsidian)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cl_hbm_0_0_stub.vhdl
-- Design      : cl_hbm_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu47p-fsvh2892-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    HBM_REF_CLK_0 : in STD_LOGIC;
    AXI_00_ACLK : in STD_LOGIC;
    AXI_00_ARESET_N : in STD_LOGIC;
    AXI_00_ARADDR : in STD_LOGIC_VECTOR ( 33 downto 0 );
    AXI_00_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_00_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_00_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_00_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_00_ARVALID : in STD_LOGIC;
    AXI_00_AWADDR : in STD_LOGIC_VECTOR ( 33 downto 0 );
    AXI_00_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_00_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_00_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_00_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_00_AWVALID : in STD_LOGIC;
    AXI_00_RREADY : in STD_LOGIC;
    AXI_00_BREADY : in STD_LOGIC;
    AXI_00_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_00_WLAST : in STD_LOGIC;
    AXI_00_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_00_WDATA_PARITY : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_00_WVALID : in STD_LOGIC;
    APB_0_PWDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    APB_0_PADDR : in STD_LOGIC_VECTOR ( 21 downto 0 );
    APB_0_PCLK : in STD_LOGIC;
    APB_0_PENABLE : in STD_LOGIC;
    APB_0_PRESET_N : in STD_LOGIC;
    APB_0_PSEL : in STD_LOGIC;
    APB_0_PWRITE : in STD_LOGIC;
    AXI_00_ARREADY : out STD_LOGIC;
    AXI_00_AWREADY : out STD_LOGIC;
    AXI_00_RDATA_PARITY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_00_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_00_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_00_RLAST : out STD_LOGIC;
    AXI_00_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_00_RVALID : out STD_LOGIC;
    AXI_00_WREADY : out STD_LOGIC;
    AXI_00_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_00_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_00_BVALID : out STD_LOGIC;
    APB_0_PRDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    APB_0_PREADY : out STD_LOGIC;
    APB_0_PSLVERR : out STD_LOGIC;
    MON_APB_0_PRESET_N : in STD_LOGIC;
    APB_0_PWDATA_MON : out STD_LOGIC_VECTOR ( 31 downto 0 );
    APB_0_PADDR_MON : out STD_LOGIC_VECTOR ( 21 downto 0 );
    APB_0_PENABLE_MON : out STD_LOGIC;
    APB_0_PSEL_MON : out STD_LOGIC;
    APB_0_PWRITE_MON : out STD_LOGIC;
    APB_0_PRDATA_MON : out STD_LOGIC_VECTOR ( 31 downto 0 );
    APB_0_PREADY_MON : out STD_LOGIC;
    APB_0_PSLVERR_MON : out STD_LOGIC;
    apb_complete_0 : out STD_LOGIC;
    DRAM_0_STAT_CATTRIP : out STD_LOGIC;
    DRAM_0_STAT_TEMP : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "cl_hbm_0_0,hbm_v1_0_17,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "cl_hbm_0_0,hbm_v1_0_17,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=hbm,x_ipVersion=1.0,x_ipCoreRevision=17,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,HBM_STACK=1,SWITCH_ENABLE_00=TRUE,SWITCH_ENABLE_01=FALSE,INIT_BYPASS=FALSE,INIT_SEQ_TIMEOUT=10000000,AXI_RST_ASSERT_WIDTH=16,AXI_RST_DEASSERT_WIDTH=2,TEMP_WAIT_PERIOD_0=100000,TEMP_WAIT_PERIOD_1=100000,SWITCH_EN_0=1,SWITCH_EN_1=0,AXI_CLK_FREQ=450,AXI_CLK1_FREQ=450,HBM_REF_CLK_FREQ_0=100,HBM_REF_CLK_FREQ_1=100,HBM_CLK_FREQ_0=900,HBM_CLK_FREQ_1=900,HBM_STACK_NUM=1,CLK_SEL_00=TRUE,CLK_SEL_01=FALSE,CLK_SEL_02=FALSE,CLK_SEL_03=FALSE,CLK_SEL_04=FALSE,CLK_SEL_05=FALSE,CLK_SEL_06=FALSE,CLK_SEL_07=FALSE,CLK_SEL_08=FALSE,CLK_SEL_09=FALSE,CLK_SEL_10=FALSE,CLK_SEL_11=FALSE,CLK_SEL_12=FALSE,CLK_SEL_13=FALSE,CLK_SEL_14=FALSE,CLK_SEL_15=FALSE,CLK_SEL_16=FALSE,CLK_SEL_17=FALSE,CLK_SEL_18=FALSE,CLK_SEL_19=FALSE,CLK_SEL_20=FALSE,CLK_SEL_21=FALSE,CLK_SEL_22=FALSE,CLK_SEL_23=FALSE,CLK_SEL_24=FALSE,CLK_SEL_25=FALSE,CLK_SEL_26=FALSE,CLK_SEL_27=FALSE,CLK_SEL_28=FALSE,CLK_SEL_29=FALSE,CLK_SEL_30=FALSE,CLK_SEL_31=FALSE,DATARATE_STACK_0=1800,DATARATE_STACK_1=1800,READ_PERCENT_00=40,READ_PERCENT_01=40,READ_PERCENT_02=40,READ_PERCENT_03=40,READ_PERCENT_04=40,READ_PERCENT_05=40,READ_PERCENT_06=40,READ_PERCENT_07=40,READ_PERCENT_08=40,READ_PERCENT_09=40,READ_PERCENT_10=40,READ_PERCENT_11=40,READ_PERCENT_12=40,READ_PERCENT_13=40,READ_PERCENT_14=40,READ_PERCENT_15=40,READ_PERCENT_16=40,READ_PERCENT_17=40,READ_PERCENT_18=40,READ_PERCENT_19=40,READ_PERCENT_20=40,READ_PERCENT_21=40,READ_PERCENT_22=40,READ_PERCENT_23=40,READ_PERCENT_24=40,READ_PERCENT_25=40,READ_PERCENT_26=40,READ_PERCENT_27=40,READ_PERCENT_28=40,READ_PERCENT_29=40,READ_PERCENT_30=40,READ_PERCENT_31=40,WRITE_PERCENT_00=40,WRITE_PERCENT_01=40,WRITE_PERCENT_02=40,WRITE_PERCENT_03=40,WRITE_PERCENT_04=40,WRITE_PERCENT_05=40,WRITE_PERCENT_06=40,WRITE_PERCENT_07=40,WRITE_PERCENT_08=40,WRITE_PERCENT_09=40,WRITE_PERCENT_10=40,WRITE_PERCENT_11=40,WRITE_PERCENT_12=40,WRITE_PERCENT_13=40,WRITE_PERCENT_14=40,WRITE_PERCENT_15=40,WRITE_PERCENT_16=40,WRITE_PERCENT_17=40,WRITE_PERCENT_18=40,WRITE_PERCENT_19=40,WRITE_PERCENT_20=40,WRITE_PERCENT_21=40,WRITE_PERCENT_22=40,WRITE_PERCENT_23=40,WRITE_PERCENT_24=40,WRITE_PERCENT_25=40,WRITE_PERCENT_26=40,WRITE_PERCENT_27=40,WRITE_PERCENT_28=40,WRITE_PERCENT_29=40,WRITE_PERCENT_30=40,WRITE_PERCENT_31=40,PAGEHIT_PERCENT_00=75,PAGEHIT_PERCENT_01=75,MC_ENABLE_00=TRUE,MC_ENABLE_01=TRUE,MC_ENABLE_02=TRUE,MC_ENABLE_03=TRUE,MC_ENABLE_04=TRUE,MC_ENABLE_05=TRUE,MC_ENABLE_06=TRUE,MC_ENABLE_07=TRUE,MC_ENABLE_08=FALSE,MC_ENABLE_09=FALSE,MC_ENABLE_10=FALSE,MC_ENABLE_11=FALSE,MC_ENABLE_12=FALSE,MC_ENABLE_13=FALSE,MC_ENABLE_14=FALSE,MC_ENABLE_15=FALSE,MC_ENABLE_APB_00=TRUE,MC_ENABLE_APB_01=FALSE,PHY_ENABLE_00=TRUE,PHY_ENABLE_01=TRUE,PHY_ENABLE_02=TRUE,PHY_ENABLE_03=TRUE,PHY_ENABLE_04=TRUE,PHY_ENABLE_05=TRUE,PHY_ENABLE_06=TRUE,PHY_ENABLE_07=TRUE,PHY_ENABLE_08=TRUE,PHY_ENABLE_09=TRUE,PHY_ENABLE_10=TRUE,PHY_ENABLE_11=TRUE,PHY_ENABLE_12=TRUE,PHY_ENABLE_13=TRUE,PHY_ENABLE_14=TRUE,PHY_ENABLE_15=TRUE,PHY_ENABLE_16=FALSE,PHY_ENABLE_17=FALSE,PHY_ENABLE_18=FALSE,PHY_ENABLE_19=FALSE,PHY_ENABLE_20=FALSE,PHY_ENABLE_21=FALSE,PHY_ENABLE_22=FALSE,PHY_ENABLE_23=FALSE,PHY_ENABLE_24=FALSE,PHY_ENABLE_25=FALSE,PHY_ENABLE_26=FALSE,PHY_ENABLE_27=FALSE,PHY_ENABLE_28=FALSE,PHY_ENABLE_29=FALSE,PHY_ENABLE_30=FALSE,PHY_ENABLE_31=FALSE,PHY_ENABLE_APB_00=TRUE,PHY_ENABLE_APB_01=FALSE}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "HBM_REF_CLK_0,AXI_00_ACLK,AXI_00_ARESET_N,AXI_00_ARADDR[33:0],AXI_00_ARBURST[1:0],AXI_00_ARID[5:0],AXI_00_ARLEN[3:0],AXI_00_ARSIZE[2:0],AXI_00_ARVALID,AXI_00_AWADDR[33:0],AXI_00_AWBURST[1:0],AXI_00_AWID[5:0],AXI_00_AWLEN[3:0],AXI_00_AWSIZE[2:0],AXI_00_AWVALID,AXI_00_RREADY,AXI_00_BREADY,AXI_00_WDATA[255:0],AXI_00_WLAST,AXI_00_WSTRB[31:0],AXI_00_WDATA_PARITY[31:0],AXI_00_WVALID,APB_0_PWDATA[31:0],APB_0_PADDR[21:0],APB_0_PCLK,APB_0_PENABLE,APB_0_PRESET_N,APB_0_PSEL,APB_0_PWRITE,AXI_00_ARREADY,AXI_00_AWREADY,AXI_00_RDATA_PARITY[31:0],AXI_00_RDATA[255:0],AXI_00_RID[5:0],AXI_00_RLAST,AXI_00_RRESP[1:0],AXI_00_RVALID,AXI_00_WREADY,AXI_00_BID[5:0],AXI_00_BRESP[1:0],AXI_00_BVALID,APB_0_PRDATA[31:0],APB_0_PREADY,APB_0_PSLVERR,MON_APB_0_PRESET_N,APB_0_PWDATA_MON[31:0],APB_0_PADDR_MON[21:0],APB_0_PENABLE_MON,APB_0_PSEL_MON,APB_0_PWRITE_MON,APB_0_PRDATA_MON[31:0],APB_0_PREADY_MON,APB_0_PSLVERR_MON,apb_complete_0,DRAM_0_STAT_CATTRIP,DRAM_0_STAT_TEMP[6:0]";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of HBM_REF_CLK_0 : signal is "xilinx.com:signal:clock:1.0 HBM_REF_CLK_0 CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of HBM_REF_CLK_0 : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of HBM_REF_CLK_0 : signal is "XIL_INTERFACENAME HBM_REF_CLK_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN clk_hbm_ref_out, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of AXI_00_ACLK : signal is "xilinx.com:signal:clock:1.0 ACLK_00_RT_8HI CLK";
  attribute X_INTERFACE_MODE of AXI_00_ACLK : signal is "slave";
  attribute X_INTERFACE_PARAMETER of AXI_00_ACLK : signal is "XIL_INTERFACENAME ACLK_00_RT_8HI, ASSOCIATED_BUSIF SAXI_00_RT_8HI, FREQ_HZ 450000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN clk_hbm_axi_out, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of AXI_00_ARESET_N : signal is "xilinx.com:signal:reset:1.0 ARST_00_N RST";
  attribute X_INTERFACE_MODE of AXI_00_ARESET_N : signal is "slave";
  attribute X_INTERFACE_PARAMETER of AXI_00_ARESET_N : signal is "XIL_INTERFACENAME ARST_00_N, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of AXI_00_ARADDR : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI ARADDR";
  attribute X_INTERFACE_MODE of AXI_00_ARADDR : signal is "slave";
  attribute X_INTERFACE_PARAMETER of AXI_00_ARADDR : signal is "XIL_INTERFACENAME SAXI_00_RT_8HI, DATA_WIDTH 256, PROTOCOL AXI3, FREQ_HZ 450000000, ID_WIDTH 6, ADDR_WIDTH 34, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN clk_hbm_axi_out, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of AXI_00_ARBURST : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI ARBURST";
  attribute X_INTERFACE_INFO of AXI_00_ARID : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI ARID";
  attribute X_INTERFACE_INFO of AXI_00_ARLEN : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI ARLEN";
  attribute X_INTERFACE_INFO of AXI_00_ARSIZE : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI ARSIZE";
  attribute X_INTERFACE_INFO of AXI_00_ARVALID : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI ARVALID";
  attribute X_INTERFACE_INFO of AXI_00_AWADDR : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI AWADDR";
  attribute X_INTERFACE_INFO of AXI_00_AWBURST : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI AWBURST";
  attribute X_INTERFACE_INFO of AXI_00_AWID : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI AWID";
  attribute X_INTERFACE_INFO of AXI_00_AWLEN : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI AWLEN";
  attribute X_INTERFACE_INFO of AXI_00_AWSIZE : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI AWSIZE";
  attribute X_INTERFACE_INFO of AXI_00_AWVALID : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI AWVALID";
  attribute X_INTERFACE_INFO of AXI_00_RREADY : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI RREADY";
  attribute X_INTERFACE_INFO of AXI_00_BREADY : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI BREADY";
  attribute X_INTERFACE_INFO of AXI_00_WDATA : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI WDATA";
  attribute X_INTERFACE_INFO of AXI_00_WLAST : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI WLAST";
  attribute X_INTERFACE_INFO of AXI_00_WSTRB : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI WSTRB";
  attribute X_INTERFACE_INFO of AXI_00_WVALID : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI WVALID";
  attribute X_INTERFACE_INFO of APB_0_PWDATA : signal is "xilinx.com:interface:apb:1.0 SAPB_0 PWDATA";
  attribute X_INTERFACE_MODE of APB_0_PWDATA : signal is "slave";
  attribute X_INTERFACE_INFO of APB_0_PADDR : signal is "xilinx.com:interface:apb:1.0 SAPB_0 PADDR";
  attribute X_INTERFACE_INFO of APB_0_PCLK : signal is "xilinx.com:signal:clock:1.0 PCLK_0 CLK";
  attribute X_INTERFACE_MODE of APB_0_PCLK : signal is "slave";
  attribute X_INTERFACE_PARAMETER of APB_0_PCLK : signal is "XIL_INTERFACENAME PCLK_0, ASSOCIATED_BUSIF SAPB_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN clk_hbm_ref_out, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of APB_0_PENABLE : signal is "xilinx.com:interface:apb:1.0 SAPB_0 PENABLE";
  attribute X_INTERFACE_INFO of APB_0_PRESET_N : signal is "xilinx.com:signal:reset:1.0 PRST_0_N RST";
  attribute X_INTERFACE_MODE of APB_0_PRESET_N : signal is "slave";
  attribute X_INTERFACE_PARAMETER of APB_0_PRESET_N : signal is "XIL_INTERFACENAME PRST_0_N, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of APB_0_PSEL : signal is "xilinx.com:interface:apb:1.0 SAPB_0 PSEL";
  attribute X_INTERFACE_INFO of APB_0_PWRITE : signal is "xilinx.com:interface:apb:1.0 SAPB_0 PWRITE";
  attribute X_INTERFACE_INFO of AXI_00_ARREADY : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI ARREADY";
  attribute X_INTERFACE_INFO of AXI_00_AWREADY : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI AWREADY";
  attribute X_INTERFACE_INFO of AXI_00_RDATA : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI RDATA";
  attribute X_INTERFACE_INFO of AXI_00_RID : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI RID";
  attribute X_INTERFACE_INFO of AXI_00_RLAST : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI RLAST";
  attribute X_INTERFACE_INFO of AXI_00_RRESP : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI RRESP";
  attribute X_INTERFACE_INFO of AXI_00_RVALID : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI RVALID";
  attribute X_INTERFACE_INFO of AXI_00_WREADY : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI WREADY";
  attribute X_INTERFACE_INFO of AXI_00_BID : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI BID";
  attribute X_INTERFACE_INFO of AXI_00_BRESP : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI BRESP";
  attribute X_INTERFACE_INFO of AXI_00_BVALID : signal is "xilinx.com:interface:aximm:1.0 SAXI_00_RT_8HI BVALID";
  attribute X_INTERFACE_INFO of APB_0_PRDATA : signal is "xilinx.com:interface:apb:1.0 SAPB_0 PRDATA";
  attribute X_INTERFACE_INFO of APB_0_PREADY : signal is "xilinx.com:interface:apb:1.0 SAPB_0 PREADY";
  attribute X_INTERFACE_INFO of APB_0_PSLVERR : signal is "xilinx.com:interface:apb:1.0 SAPB_0 PSLVERR";
  attribute X_INTERFACE_INFO of MON_APB_0_PRESET_N : signal is "xilinx.com:signal:reset:1.0 MON_PRST_0_N RST";
  attribute X_INTERFACE_MODE of MON_APB_0_PRESET_N : signal is "slave";
  attribute X_INTERFACE_PARAMETER of MON_APB_0_PRESET_N : signal is "XIL_INTERFACENAME MON_PRST_0_N, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of APB_0_PWDATA_MON : signal is "xilinx.com:interface:apb:1.0 MON_MAPB_0 PWDATA";
  attribute X_INTERFACE_MODE of APB_0_PWDATA_MON : signal is "monitor mirroredSlave";
  attribute X_INTERFACE_INFO of APB_0_PADDR_MON : signal is "xilinx.com:interface:apb:1.0 MON_MAPB_0 PADDR";
  attribute X_INTERFACE_INFO of APB_0_PENABLE_MON : signal is "xilinx.com:interface:apb:1.0 MON_MAPB_0 PENABLE";
  attribute X_INTERFACE_INFO of APB_0_PSEL_MON : signal is "xilinx.com:interface:apb:1.0 MON_MAPB_0 PSEL";
  attribute X_INTERFACE_INFO of APB_0_PWRITE_MON : signal is "xilinx.com:interface:apb:1.0 MON_MAPB_0 PWRITE";
  attribute X_INTERFACE_INFO of APB_0_PRDATA_MON : signal is "xilinx.com:interface:apb:1.0 MON_MAPB_0 PRDATA";
  attribute X_INTERFACE_INFO of APB_0_PREADY_MON : signal is "xilinx.com:interface:apb:1.0 MON_MAPB_0 PREADY";
  attribute X_INTERFACE_INFO of APB_0_PSLVERR_MON : signal is "xilinx.com:interface:apb:1.0 MON_MAPB_0 PSLVERR";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "hbm_v1_0_17,Vivado 2025.1";
begin
end;
