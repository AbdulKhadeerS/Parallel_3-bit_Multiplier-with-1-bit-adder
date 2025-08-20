# ==============================
# SDC File for Parallel 3-bit Multiplier (Tweaked)
# ==============================

# Primary clock (200 MHz -> 5 ns period)
create_clock -name clk -period 5.0 [get_ports CLK1]

# Input delay (2.2 ns)
set_input_delay 2.2 -clock clk [all_inputs]

# Output delay (2.8 ns)
set_output_delay 2.8 -clock clk [all_outputs]

# Clock uncertainty (0.2 ns)
set_clock_uncertainty 0.2 [get_clocks clk]

# Drive strength
set_driving_cell -lib_cell INVX1 [all_inputs]

# Output load (you had ~0.137 pF, keeping as realistic typical load)
set_load 0.137 [all_outputs]

# OCV derates (basic variation support)
set_timing_derate -early 0.95 [current_design]
set_timing_derate -late 1.05 [current_design]

# ==============================
# New Tweaks (based on your .lib)
# ==============================

# Max transition (slew): 0.1985 ns from stdcells.lib
set_max_transition 0.1985 [all_inputs]
set_max_transition 0.1985 [all_outputs]

# Max capacitance: 10.4713 pF from stdcells.lib
set_max_capacitance 10.4713 [all_outputs]

# (Optional: You can keep fanout constraint if you want to be conservative)
set_max_fanout 8 [all_outputs]

