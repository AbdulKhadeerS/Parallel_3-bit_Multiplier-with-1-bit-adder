#PDK root, Std cell library to be given only when utilizing custom pdk
# Set the PDK root path
#set ::env(PDK_ROOT) "/home/abdulkhadeer/.volare/sky130A/ libs.tech/ openlane"

# Set the PDK (usually 'sky130A' or 'sky130')
#set ::env(PDK) "sky130A"

#set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"


set ::env(DESIGN_NAME) {parallel_3_bit_mult}
# Include ALL Verilog files (top + submodules)

set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

# Clock settings
set ::env(CLOCK_PORT) "CLK1"
set ::env(CLOCK_PERIOD) "2.5"

# SDC constraint file
set ::env(SDC_FILE) "$::env(DESIGN_DIR)/src/parallel_3_bit_mult.sdc"

# PNR_SDC_File
set ::env(SDC_FILE) "$::env(DESIGN_DIR)/src/PNR_SDC_FILE.sdc"

#SIGNOFF_SDC
set ::env(SDC_FILE) "$::env(DESIGN_DIR)/src/SIGNOFF_SDC_FILE.sdc"

# Floorplan tuning
# How much of the core area to be utilized
set ::env(CORE_UTILIZATION) 45

# How much padding to a std cell needed to be given for easy routing
set ::env(GPL_CELL_PADDING) 2

# Defines the core width to length area
set ::env(FP_ASPECT_RATIO) 1.0

# PDN (power delivery network) multilayer setup
set ::env(FP_PDN_MULTILAYER) {1}

# Change it only when getting error that pitch is too low
set ::env(FP_PDN_VPITCH) 6.6
set ::env(FP_PDN_HPITCH) 6.6


set tech_specific_config "$::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl"
if { [file exists $tech_specific_config] == 1 } {
    source $tech_specific_config
}
