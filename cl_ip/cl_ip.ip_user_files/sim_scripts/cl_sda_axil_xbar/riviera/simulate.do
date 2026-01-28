transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+cl_sda_axil_xbar  -L xil_defaultlib -L xilinx_vip -L xpm -L generic_baseblocks_v2_1_2 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_36 -L fifo_generator_v13_2_14 -L axi_data_fifo_v2_1_36 -L axi_crossbar_v2_1_38 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.cl_sda_axil_xbar xil_defaultlib.glbl

do {cl_sda_axil_xbar.udo}

run 1000ns

endsim

quit -force
