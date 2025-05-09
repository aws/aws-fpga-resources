onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xilinx_vip -L xpm -L generic_baseblocks_v2_1_2 -L fifo_generator_v13_2_10 -L axi_data_fifo_v2_1_30 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_31 -L axi_protocol_converter_v2_1_31 -L axi_clock_converter_v2_1_30 -L blk_mem_gen_v8_4_8 -L axi_dwidth_converter_v2_1_31 -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.cl_axi_width_cnv_512_to_256 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {cl_axi_width_cnv_512_to_256.udo}

run 1000ns

quit -force
