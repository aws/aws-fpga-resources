vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/proc_sys_reset_v5_0_17
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_36
vlib questa_lib/msim/axi_vip_v1_1_22

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap proc_sys_reset_v5_0_17 questa_lib/msim/proc_sys_reset_v5_0_17
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_36 questa_lib/msim/axi_register_slice_v2_1_36
vmap axi_vip_v1_1_22 questa_lib/msim/axi_vip_v1_1_22

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi_vip_if.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/clk_vip_if.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"$XILINX_VIVADO/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"$XILINX_VIVADO/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"$XILINX_VIVADO/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work proc_sys_reset_v5_0_17 -64 -93  \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_6722_psr0_0.vhd" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_6722_psr_aclk_0.vhd" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_6722_psr_aclk1_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_6722_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_6722_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_6722_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_6722_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_6722_sarn_0.sv" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_6722_srn_0.sv" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_6722_sawn_0.sv" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_6722_swn_0.sv" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_6722_sbn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_6722_m00s2a_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/e44a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_6722_m00e_0.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/bd_0/sim/bd_6722.v" \

vcom -work smartconnect_v1_0 -64 -93  \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.sv" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_36 -64 -incr -mfcu  "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/bc4b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_22 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/b16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L hbm_v1_0_18 -L xilinx_vip "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../bd/cl_axi_sc_1x1/ip/cl_axi_sc_1x1_smartconnect_0_0/sim/cl_axi_sc_1x1_smartconnect_0_0.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/00fe/hdl/verilog" "+incdir+../../../../cl_ip.gen/sources_1/bd/cl_axi_sc_1x1/ipshared/ec67/hdl" "+incdir+$XILINX_VIVADO/data/rsb/busdef" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" \
"../../../bd/cl_axi_sc_1x1/sim/cl_axi_sc_1x1.v" \

vlog -work xil_defaultlib \
"glbl.v"

