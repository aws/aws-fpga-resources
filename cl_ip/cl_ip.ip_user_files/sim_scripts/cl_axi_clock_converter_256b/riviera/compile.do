transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/fifo_generator_v13_2_11
vlib riviera/axi_clock_converter_v2_1_32
vlib riviera/xil_defaultlib

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap fifo_generator_v13_2_11 riviera/fifo_generator_v13_2_11
vmap axi_clock_converter_v2_1_32 riviera/axi_clock_converter_v2_1_32
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xilinx_vip  -incr -l axi_vip_v1_1_19 -l smartconnect_v1_0 -l hbm_v1_0_16 -l xdma_v4_1_31 "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l fifo_generator_v13_2_11 -l axi_clock_converter_v2_1_32 -l xil_defaultlib \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/axi_vip_if.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/clk_vip_if.sv" \
"$XILINX_VIVADO/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -l axi_vip_v1_1_19 -l smartconnect_v1_0 -l hbm_v1_0_16 -l xdma_v4_1_31 "+incdir+../../../ipstatic/hdl" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l fifo_generator_v13_2_11 -l axi_clock_converter_v2_1_32 -l xil_defaultlib \
"$XILINX_VIVADO/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"$XILINX_VIVADO/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"$XILINX_VIVADO/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../ipstatic/hdl" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l fifo_generator_v13_2_11 -l axi_clock_converter_v2_1_32 -l xil_defaultlib \
"../../../ipstatic/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_11  -incr -v2k5 "+incdir+../../../ipstatic/hdl" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l fifo_generator_v13_2_11 -l axi_clock_converter_v2_1_32 -l xil_defaultlib \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_11 -93  -incr \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_11  -incr -v2k5 "+incdir+../../../ipstatic/hdl" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l fifo_generator_v13_2_11 -l axi_clock_converter_v2_1_32 -l xil_defaultlib \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_clock_converter_v2_1_32  -incr -v2k5 "+incdir+../../../ipstatic/hdl" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l fifo_generator_v13_2_11 -l axi_clock_converter_v2_1_32 -l xil_defaultlib \
"../../../ipstatic/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../ipstatic/hdl" "+incdir+$XILINX_VIVADO/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l fifo_generator_v13_2_11 -l axi_clock_converter_v2_1_32 -l xil_defaultlib \
"../../../../cl_ip.gen/sources_1/ip/cl_axi_clock_converter_256b/sim/cl_axi_clock_converter_256b.v" \

vlog -work xil_defaultlib \
"glbl.v"

