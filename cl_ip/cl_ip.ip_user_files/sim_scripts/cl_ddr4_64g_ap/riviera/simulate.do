transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+cl_ddr4_64g_ap  -L xil_defaultlib -L xilinx_vip -L xpm -L microblaze_v11_0_15 -L proc_sys_reset_v5_0_17 -L lmb_v10_v3_0_15 -L lmb_bram_if_cntlr_v4_0_26 -L blk_mem_gen_v8_4_11 -L iomodule_v3_1_12 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.cl_ddr4_64g_ap xil_defaultlib.glbl

do {cl_ddr4_64g_ap.udo}

run 1000ns

endsim

quit -force
