# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

set script_dir [file dirname [file normalize [info script]]]

set ::env(BASE_SDC_FILE) $script_dir/constr.sdc

set ::env(VERILOG_FILES) "[glob $script_dir/../RTL/SRAM16*.v]"

set ::env(VERILOG_FILES_BLACKBOX) "\
	$script_dir/../OpenRAM/sky130_sram_2kbyte_1rw1r_32x512_8.v"

set ::env(EXTRA_LEFS) "\
	$script_dir/../OpenRAM/sky130_sram_2kbyte_1rw1r_32x512_8.lef"

set ::env(EXTRA_GDS_FILES) "\
	$script_dir/../OpenRAM/sky130_sram_2kbyte_1rw1r_32x512_8.gds"

set ::env(EXTRA_LIBS) "\
	$script_dir/../OpenRAM/sky130_sram_2kbyte_1rw1r_32x512_8.lib"

set ::env(ROUTING_CORES) "6
"
set ::env(RUN_SIMPLE_CTS) "0"

set ::env(DESIGN_NAME) SRAM16K
set ::env(DESIGN_IS_CORE) 1
set ::env(RUN_KLAYOUT) 0

set ::env(CLOCK_PORT) "clk"
#set ::env(RESET_PORT) "RSTn"

#set ::env(CLOCK_NET) "HCLK"
set ::env(CLOCK_PERIOD) "15"

set ::env(SYNTH_STRATEGY) "DELAY 1"
set ::env(SYNTH_MAX_FANOUT) 10
set ::env(SYNTH_READ_BLACKBOX_LIB) 1

set ::env(SYNTH_DRIVING_CELL) "sky130_fd_sc_hd__inv_1"
set ::env(SYNTH_CAP_LOAD) "33.442"

set ::env(FP_VERTICAL_TAP_HALO) $::env(FP_VERTICAL_HALO)
set ::env(FP_HORIZONTAL_TAP_HALO) $::env(FP_HORIZONTAL_HALO)

set ::env(FP_PDN_CORE_RING) 1

set ::env(FP_PDN_VPITCH) 50
set ::env(FP_PDN_HPITCH) 100
set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 1700 2050"

set ::env(LEFT_MARGIN_MULT) 24
set ::env(RIGHT_MARGIN_MULT) 24

set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro_placement.tcl
set ::env(PL_TARGET_DENSITY) 0.30
set ::env(CELL_PAD) 0

# Disable resizer design optimizations to prevent adding a buffer after tristate cells
set ::env(PL_RESIZER_HOLD_MAX_BUFFER_PERCENT) 100
set ::env(PL_RESIZER_SETUP_MAX_BUFFER_PERCENT) 20

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 1
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1
set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 0

set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) 0.90
set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 0.50

set ::env(PL_RESIZER_SETUP_SLACK_MARGIN) 0.1
set ::env(GLB_RESIZER_SETUP_SLACK_MARGIN) 0.0

set ::env(CTS_TARGET_SKEW) "0"
set ::env(CTS_TOLERANCE) "20"
set ::env(CTS_CLK_MAX_WIRE_LENGTH) 500
set ::env(GLB_RT_CLOCK_MINLAYER) 3
#set ::env(GLB_RT_CLOCK_MAXLAYER) 5
set ::env(CTS_CLK_BUFFER_LIST) "sky130_fd_sc_hd__clkbuf_2 sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_8"

set ::env(PL_RESIZER_MAX_WIRE_LENGTH) 1000

#set ::env(GLB_RT_ADJUSTMENT) 0
set ::env(GLB_RT_L1_ADJUSTMENT) 1.0
set ::env(GLB_RT_L2_ADJUSTMENT) 0.11
set ::env(GLB_RT_L3_ADJUSTMENT) 0.11
set ::env(GLB_RT_L4_ADJUSTMENT) 0.1
set ::env(GLB_RT_L5_ADJUSTMENT) 0.1
set ::env(GLB_RT_L6_ADJUSTMENT) 0.1
set ::env(GLB_RT_ALLOW_CONGESTION) 1
set ::env(GLB_RT_OVERFLOW_ITERS) 200

set ::env(GLB_RT_MIN_LAYER) 1
set ::env(RT_MIN_LAYER) "met1"

set ::env(DIODE_INSERTION_STRATEGY) 4

set ::env(PL_RESIZER_MAX_SLEW_MARGIN) 0
set ::env(PL_RESIZER_MAX_CAP_MARGIN) 0

## DRC
set ::env(MAGIC_DRC_USE_GDS) 0
set ::env(QUIT_ON_MAGIC_DRC) 0
set ::env(QUIT_ON_SETUP_VIOLATIONS) 0

##
set ::env(FP_VERTICAL_HALO) 7
set ::env(FP_HORIZONTAL_HALO) 7
set ::env(STA_REPORT_POWER) 0
