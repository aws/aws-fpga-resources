onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xil_defaultlib -L xilinx_vip -L xpm -L microblaze_v11_0_15 -L proc_sys_reset_v5_0_17 -L lmb_v10_v3_0_15 -L lmb_bram_if_cntlr_v4_0_26 -L blk_mem_gen_v8_4_11 -L iomodule_v3_1_12 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.cl_ddr4_32g xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {cl_ddr4_32g.udo}

run 1000ns

quit -force
