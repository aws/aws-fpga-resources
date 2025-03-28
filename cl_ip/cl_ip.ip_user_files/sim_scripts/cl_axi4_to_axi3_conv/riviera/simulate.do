transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+cl_axi4_to_axi3_conv  -L xil_defaultlib -L xilinx_vip -L xpm -L generic_baseblocks_v2_1_2 -L fifo_generator_v13_2_11 -L axi_data_fifo_v2_1_32 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_33 -L axi_protocol_converter_v2_1_33 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.cl_axi4_to_axi3_conv xil_defaultlib.glbl

do {cl_axi4_to_axi3_conv.udo}

run 1000ns

endsim

quit -force
