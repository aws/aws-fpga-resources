onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xil_defaultlib -L xilinx_vip -L xpm -L microblaze_v11_0_14 -L lib_cdc_v1_0_3 -L proc_sys_reset_v5_0_16 -L lmb_v10_v3_0_14 -L lmb_bram_if_cntlr_v4_0_25 -L blk_mem_gen_v8_4_9 -L iomodule_v3_1_11 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.cl_ddr4_32g_ap xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {cl_ddr4_32g_ap.udo}

run 1000ns

quit -force
