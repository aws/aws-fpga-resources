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

###############################################################################
# OOC Source Clocks
###############################################################################
#CL HBM reference clock @100MHz
create_clock -period 10.000 -name clk_hbm_ref  -waveform {0.000 5.000} [get_ports clk_hbm_ref]

# Group A Clocks
create_clock -period 4  -name clk_main_a0 -waveform {0.000 2}  [get_ports clk_main_a0]
