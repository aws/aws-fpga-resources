# =============================================================================
# Amazon FPGA Hardware Development Kit
#
# Copyright 2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License"). You may not use
# this file except in compliance with the License. A copy of the License is
# located at
#
#    http://aws.amazon.com/asl/
#
# or in the "license" file accompanying this file. This file is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
# implied. See the License for the specific language governing permissions and
# limitations under the License.
# =============================================================================

proc fileSearch {searchString fileName} {
  package require fileutil
  set pattern {grep}
  if [llength [fileutil::grep $searchString $fileName]] {
    return 1
  }
}


#Temp for testing should be in main script
#open_bd_design [get_files -quiet cl.bd]
if {[info exist FAAS_CL_DIR] eq 0} {
	if {[info exist ::env(FAAS_CL_DIR)] eq 0} {
		if {[get_files -quiet cl.bd] ne ""} {
			aws::make_ipi
		} else {
			aws::make_rtl
		}
	}
}

set FAAS_CL_DIR $::env(FAAS_CL_DIR)
puts "here"
puts $::env(FAAS_CL_DIR)
#puts $::env(BD_LOCATION)

#Determine if variables are set, I.E new terminal with existing design
if {[info exist ::env(CLOCK_A_RECIPE)]} {
   set var_refresh 0
   } else {
   set var_refresh 1
   }

#only do this if needs refresh on synth
if {[get_property NEEDS_REFRESH [current_run -synthesis]] eq 1 || [get_property progress [current_run -synthesis]] ne "100%" || $var_refresh eq 1 } {
	#TODO
	#what about non-bd flow (RTL only)?  where to get clock_a_recipe?  Or is this only for IPI flow, no preset for manual RTL flow?
	if {[info exist ::env(BD_LOCATION)] eq 0} {

		#have customers set environment varibles for a,b,c
		if {[info exist ::env(CLOCK_A_RECIPE)]} {
			set clock_recipe_a $::env(CLOCK_A_RECIPE)
		} else {
			send_msg_id "synth_design_post 0-2" ERROR "CLOCK_A_RECIPE not set.  Please set CLOCK_A_RECIPE environment variable to a value between 0:2.\n  example:\n\t set ::env(CLOCK_A_RECIPE) 0"
		}
		if {[info exist ::env(CLOCK_B_RECIPE)]} {
			set clock_recipe_b $::env(CLOCK_B_RECIPE)
		} else {
			send_msg_id "synth_design_post 0-5" ERROR "CLOCK_B_RECIPE not set.  Please set CLOCK_B_RECIPE environment variable to a value between 0:5.\n  example:\n\t set ::env(CLOCK_B_RECIPE) 0"
		}
		if {[info exist ::env(CLOCK_C_RECIPE)]} {
			set clock_recipe_c $::env(CLOCK_C_RECIPE)
		} else {
			send_msg_id "synth_design_post 0-3" ERROR "CLOCK_C_RECIPE not set.  Please set CLOCK_C_RECIPE environment variable to a value between 0:3.\n  example:\n\t set ::env(CLOCK_C_RECIPE) 0"
		}

		if {[info exist ::env(CLOCK_HBM_RECIPE)]} {
			set clock_recipe_hbm $::env(CLOCK_HBM_RECIPE)
		} else {
			send_msg_id "synth_design_post 0-5" ERROR "CLOCK_HBM_RECIPE not set.  Please set CLOCK_HBM_RECIPE environment variable to a value between 0:5.\n  example:\n\t set ::env(CLOCK_HBM_RECIPE) 0"
		}
		if {[info exist ::env(device_id)]} {
			set device_id $::env(device_id)
		} else {
			send_msg_id "synth_design_post 0-2" ERROR "device_id not set.  Please set device_id environment variable to a valid value.\n  example:\n\t set ::env(device_id) 0xF000"
		}
		if {[info exist ::env(vendor_id)]} {
			set device_id $::env(vendor_id)
		} else {
			send_msg_id "synth_design_post 0-2" ERROR "vendor_id not set.  Please set vendor_id environment variable to a valid value.\n  example:\n\t set ::env(vendor_id) 0x0001"
		}
		if {[info exist ::env(subsystem_id)]} {
			set device_id $::env(subsystem_id)
		} else {
			send_msg_id "synth_design_post 0-2" ERROR "subsystem_id not set.  Please set subsystem_id environment variable to a valid value.\n  example:\n\t set ::env(subsystem_id) 0x1D51"
		}
		if {[info exist ::env(subsystem_vendor_id)]} {
			set device_id $::env(subsystem_vendor_id)
		} else {
			send_msg_id "synth_design_post 0-2" ERROR "subsystem_vendor_id not set.  Please set subsystem_vendor_id environment variable to a valid value.\n  example:\n\t set ::env(subsystem_vendor_id) 0xFEDD"
		}


	} else {
		puts "BD_LOCATION - $::env(BD_LOCATION)"

		read_bd $::env(BD_LOCATION) -quiet
		open_bd_design $::env(BD_LOCATION)

		set THE_INSTANCE [get_bd_cell -hierarchical -filter "VLNV == [lindex [lsort [get_param bd.faas_ipname]] end]"]
		puts "Searching for instance $THE_INSTANCE"

		set clock_recipe_a [get_property CONFIG.CLOCK_A_RECIPE [get_bd_cells $THE_INSTANCE]]
		set clock_recipe_b [get_property CONFIG.CLOCK_B_RECIPE [get_bd_cells $THE_INSTANCE]]
		set clock_recipe_c [get_property CONFIG.CLOCK_C_RECIPE [get_bd_cells $THE_INSTANCE]]
		set clock_recipe_hbm "2"

		set device_id [get_property CONFIG.DEVICE_ID [get_bd_cells $THE_INSTANCE]]
		set vendor_id [get_property CONFIG.VENDOR_ID [get_bd_cells $THE_INSTANCE]]
		set subsystem_id [get_property CONFIG.SUBSYSTEM_ID [get_bd_cells $THE_INSTANCE]]
		set subsystem_vendor_id [get_property CONFIG.SUBSYSTEM_VENDOR_ID [get_bd_cells $THE_INSTANCE]]

		set faas_shell_version [get_property CONFIG.SHELL_VERSION [get_bd_cells $THE_INSTANCE]]

		set ::env(CLOCK_A_RECIPE) $clock_recipe_a
		set ::env(CLOCK_B_RECIPE) $clock_recipe_b
		set ::env(CLOCK_C_RECIPE) $clock_recipe_c
		set ::env(CLOCK_C_RECIPE) $clock_recipe_c
		set ::env(CLOCK_HBM_RECIPE) $clock_recipe_hbm

		set ::env(device_id) $device_id
		set ::env(vendor_id) $vendor_id
		set ::env(subsystem_id) $subsystem_id
		set ::env(subsystem_vendor_id) $subsystem_vendor_id

		set ::env(FAAS_SHELL_VERSION) $faas_shell_version

	}




	file mkdir $FAAS_CL_DIR/build/checkpoints



	set const_dir [file normalize [file join $FAAS_CL_DIR build constraints ]]

	# Write out CL clocks constraints

	file mkdir $const_dir
	if { [file exists ${const_dir}/aws_gen_clk_constraints.tcl] } {
	        puts "Deleting old CL clocks constraints file since it will be replaced.";
	        file delete -force ${const_dir}/aws_gen_clk_constraints.tcl
	}

	send_msg_id "launch_runs_pre 10-59" INFO "Creating constraints for aws_gen_clk (clock settings for CL) in file\n\t${const_dir}/aws_gen_clk_constraints.tcl"
	set clocks_file [open "${const_dir}/aws_gen_clk_constraints.tcl" w]

	# Set Clock Group properties based on specified recipe
	# Clock Group A
	puts $clocks_file "set_property CLKFBOUT_MULT_F   9.5 \[get_cells WRAPPER/IO_SHIM/RL_CLKS/MMCM_CLK_MAIN_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells WRAPPER/IO_SHIM/RL_CLKS/MMCM_CLK_MAIN_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F  4.750 \[get_cells WRAPPER/IO_SHIM/RL_CLKS/MMCM_CLK_MAIN_A/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst\]\n"

        puts $clocks_file "if {\[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I}\] != {}} {\n"

	if {[string compare $clock_recipe_a "1"] == 0} {
	puts $clocks_file "set_property CLKFBOUT_MULT_F   15 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    12 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE     4 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT2_DIVIDE     3 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	} elseif {[string compare $clock_recipe_a "2"] == 0} {
	puts $clocks_file "set_property CLKFBOUT_MULT_F  12.500 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    80 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE    10 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT2_DIVIDE    20 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	} else { #A0
	puts $clocks_file "set_property CLKFBOUT_MULT_F  15 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    24 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE     8 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT2_DIVIDE     6 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_A_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	}
        puts $clocks_file "  }\n"

        puts $clocks_file "if {\[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I}\] != {}} {\n"

	if {[string compare $clock_recipe_b "1"] == 0} {
	puts $clocks_file "set_property CLKFBOUT_MULT_F   11.875 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    9.5 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE     19 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	} elseif {[string compare $clock_recipe_b "2"] == 0} {
	puts $clocks_file "set_property CLKFBOUT_MULT_F  11.250 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    2.5 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE    5 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	} elseif {[string compare $clock_recipe_b "3"] == 0} {
	puts $clocks_file "set_property CLKFBOUT_MULT_F  11.875 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    4.750 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE    19 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	} elseif {[string compare $clock_recipe_b "4"] == 0} {
	puts $clocks_file "set_property CLKFBOUT_MULT_F  12 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    4 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE    16 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	} elseif {[string compare $clock_recipe_b "5"] == 0} {
	puts $clocks_file "set_property CLKFBOUT_MULT_F  12 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    3 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE    12 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	} else { #B0
	puts $clocks_file "set_property CLKFBOUT_MULT_F  12.5 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    5 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE     10 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_B_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	}
        puts $clocks_file "  }\n"

        puts $clocks_file "if {\[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I}\] != {}} {\n"

	if {[string compare $clock_recipe_c "1"] == 0} {
	puts $clocks_file "set_property CLKFBOUT_MULT_F   12 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    8 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE     6 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	} elseif {[string compare $clock_recipe_c "2"] == 0} {
	puts $clocks_file "set_property CLKFBOUT_MULT_F  12 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    16 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE    12 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	} elseif {[string compare $clock_recipe_c "3"] == 0} {
	puts $clocks_file "set_property CLKFBOUT_MULT_F  8 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    4 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE    3 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	} else { #C0
	puts $clocks_file "set_property CLKFBOUT_MULT_F  12 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    4 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
	puts $clocks_file "set_property CLKOUT1_DIVIDE     3 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_C_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
	}
        puts $clocks_file "  }\n"

         puts $clocks_file "if {\[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I}\] != {}} {\n"

 	if {[string compare $clock_recipe_hbm "1"] == 0} {
 	puts $clocks_file "set_property CLKFBOUT_MULT_F   11.875 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
 	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
 	puts $clocks_file "set_property CLKOUT0_DIVIDE_F     9.5 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
 	} elseif {[string compare $clock_recipe_hbm "2"] == 0} {
 	puts $clocks_file "set_property CLKFBOUT_MULT_F  11.250 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
 	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
 	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    2.5 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
 	} elseif {[string compare $clock_recipe_hbm "3"] == 0} {
 	puts $clocks_file "set_property CLKFBOUT_MULT_F  12 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
 	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
 	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    4 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
 	} elseif {[string compare $clock_recipe_hbm "4"] == 0} {
 	puts $clocks_file "set_property CLKFBOUT_MULT_F  12 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
 	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
 	puts $clocks_file "set_property CLKOUT0_DIVIDE_F    3 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
 	} else { #H0
 	puts $clocks_file "set_property CLKFBOUT_MULT_F  12.5 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
 	puts $clocks_file "set_property DIVCLK_DIVIDE     1 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]"
 	puts $clocks_file "set_property CLKOUT0_DIVIDE_F     5 \[get_cells -hier -quiet -filter {NAME =~ *CLK_MMCM_HBM_I/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst}\]\n"
 	}
        puts $clocks_file "  }\n"

	close $clocks_file


# Clock Group A
switch $clock_recipe_a {
    "0" {
        #NOT SUPPORTED# set clk_main_a0_period        8
        #NOT SUPPORTED# set clk_main_a0_half_period   4
        set ::env(clock_main_a0) 250
        set clk_main_a0_period        4
        set clk_main_a0_half_period   2
        set clk_extra_a1_period      16
        set clk_extra_a1_half_period  8
        set clk_extra_a2_period       5.333
        set clk_extra_a2_half_period  2.667
        set clk_extra_a3_period       4
        set clk_extra_a3_half_period  2
    }
    "1" {
        set ::env(clock_main_a0) 250
        set clk_main_a0_period        4
        set clk_main_a0_half_period   2
        set clk_extra_a1_period       8
        set clk_extra_a1_half_period  4
        set clk_extra_a2_period       2.667
        set clk_extra_a2_half_period  1.333
        set clk_extra_a3_period       2
        set clk_extra_a3_half_period  1
    }
    "2" {
        #NOT SUPPORTED# set clk_main_a0_period        64
        #NOT SUPPORTED# set clk_main_a0_half_period   32
        set ::env(clock_main_a0) 250
        set clk_main_a0_period         4
        set clk_main_a0_half_period    2
        set clk_extra_a1_period      128
        set clk_extra_a1_half_period  64
        set clk_extra_a2_period        8
        set clk_extra_a2_half_period   4
        set clk_extra_a3_period       16
        set clk_extra_a3_half_period   8
    }
    default {
        puts "$clock_recipe_a is NOT a valid clock_recipe_a."
    }
}

# Clock Group B
switch $clock_recipe_b {
    "0" {
        set clk_extra_b0_period       4
        set clk_extra_b0_half_period  2
        set clk_extra_b1_period       8
        set clk_extra_b1_half_period  4
    }
    "1" {
        set clk_extra_b0_period       8
        set clk_extra_b0_half_period  4
        set clk_extra_b1_period      16
        set clk_extra_b1_half_period  8
    }
    "2" {
        set clk_extra_b0_period       2.222
        set clk_extra_b0_half_period  1.111
        set clk_extra_b1_period       4.444
        set clk_extra_b1_half_period  2.222
    }
    "3" {
        set clk_extra_b0_period       4
        set clk_extra_b0_half_period  2
        set clk_extra_b1_period      16
        set clk_extra_b1_half_period  8
    }
    "4" {
        set clk_extra_b0_period       3.333
        set clk_extra_b0_half_period  1.667
        set clk_extra_b1_period      13.333
        set clk_extra_b1_half_period  6.667
    }
    "5" {
        set clk_extra_b0_period       2.5
        set clk_extra_b0_half_period  1.25
        set clk_extra_b1_period      10
        set clk_extra_b1_half_period  5
    }
    default {
        puts "$clock_recipe_b is NOT a valid clock_recipe_b."
    }
}

# Clock Group C
switch $clock_recipe_c {
    "0" {
        set clk_extra_c0_period       3.333
        set clk_extra_c0_half_period  1.667
        set clk_extra_c1_period       2.5
        set clk_extra_c1_half_period  1.25
    }
    "1" {
        set clk_extra_c0_period       6.667
        set clk_extra_c0_half_period  3.333
        set clk_extra_c1_period       5
        set clk_extra_c1_half_period  2.5
    }
    "2" {
        set clk_extra_c0_period      13.333
        set clk_extra_c0_half_period  6.667
        set clk_extra_c1_period      10
        set clk_extra_c1_half_period  5
    }
    "3" {
        set clk_extra_c0_period       5
        set clk_extra_c0_half_period  2.5
        set clk_extra_c1_period       3.75
        set clk_extra_c1_half_period  1.875
    }
    default {
        puts "$clock_recipe_c is NOT a valid clock_recipe_c."
    }
}

# Clock Group HBM
switch $clock_recipe_hbm {
    "H0" {
        set clk_hbm_axi_period       4
        set clk_hbm_axi_half_period  2
    }
    "H1" {
        set clk_hbm_axi_period       8
        set clk_hbm_axi_half_period  4
    }
    "H2" {
        set clk_hbm_axi_period       2.222
        set clk_hbm_axi_half_period  1.111
    }
    "H3" {
        set clk_hbm_axi_period       3.333
        set clk_hbm_axi_half_period  1.667
    }
    "H4" {
        set clk_hbm_axi_period       2.5
        set clk_hbm_axi_half_period  1.25
    }
    default {
        puts "$clock_recipe_hbm is NOT a valid clock_recipe_hbm."
    }
}

	#if { [file exists ${const_dir}/cl_clocks_aws.xdc] } {
	#        puts "Deleting old CL clocks constraints file since it will be replaced.";
	#        file delete -force ${const_dir}/cl_clocks_aws.xdc
	#}
	set clocks_file [open "${const_dir}/cl_clocks_aws.xdc" w]

puts $clocks_file "#-------------------------------------------------------------------------"
puts $clocks_file "# Do not edit this file! It is auto-generated."
puts $clocks_file "#-------------------------------------------------------------------------"

puts $clocks_file "###############################################################################                          "
puts $clocks_file "# OOC Source Clocks                                                                                      "
puts $clocks_file "###############################################################################                          "
puts $clocks_file "#CL HBM reference clock @100MHz                                                                          "
puts $clocks_file "create_clock -period 10.000 -name clk_hbm_ref  -waveform {0.000 5.000} \[get_ports clk_hbm_ref\]       \n"

puts $clocks_file "# Group A Clocks"
puts $clocks_file "create_clock -period $clk_main_a0_period  -name clk_main_a0 -waveform {0.000 $clk_main_a0_half_period}  \[get_ports clk_main_a0\]"

close $clocks_file
	puts "current_project [current_project]"
	puts [report_property [current_project]]
	puts "*********************************"
	puts "current_run [current_run]"
	puts [report_property [current_run]]

	add_files -fileset constrs_1 -norecurse ${const_dir}/cl_clocks_aws.xdc
	set_property PROCESSING_ORDER EARLY [get_files ${const_dir}/cl_clocks_aws.xdc]
	set_property USED_IN {synthesis implementation out_of_context} [get_files ${const_dir}/cl_clocks_aws.xdc]


	set synth_env_file [open "$FAAS_CL_DIR/build/checkpoints/enviroment_$::env(timestamp).tcl" w]
	set synth_cur_file [open "$FAAS_CL_DIR/build/checkpoints/enviroment_current.tcl" w]

	puts $synth_env_file "set ::env(device_id) $::env(device_id)"
	puts $synth_cur_file "set ::env(device_id) $::env(device_id)"
	puts $synth_env_file "set ::env(vendor_id) $::env(vendor_id)"
	puts $synth_cur_file "set ::env(vendor_id) $::env(vendor_id)"
	puts $synth_env_file "set ::env(subsystem_id) $::env(subsystem_id)"
	puts $synth_cur_file "set ::env(subsystem_id) $::env(subsystem_id)"
	puts $synth_env_file "set ::env(subsystem_vendor_id) $::env(subsystem_vendor_id)"
	puts $synth_cur_file "set ::env(subsystem_vendor_id) $::env(subsystem_vendor_id)"


	puts $synth_env_file "set ::env(clock_main_a0) $::env(clock_main_a0)"
	puts $synth_cur_file "set ::env(clock_main_a0) $::env(clock_main_a0)"


	puts $synth_env_file "set ::env(timestamp) $::env(timestamp)"
	puts $synth_cur_file "set ::env(timestamp) $::env(timestamp)"



	close $synth_env_file
	close $synth_cur_file

} else {
	report_property [current_run -synthesis]
}
