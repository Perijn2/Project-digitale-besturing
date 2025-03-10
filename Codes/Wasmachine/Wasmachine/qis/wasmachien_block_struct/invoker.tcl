package require ::quartus::project
set need_to_close_project 0
set make_assignments 1
# Check that the right project is open
if {[is_project_open]} {
   if {[string compare $quartus(project) "wasmachien_block"]} {
      puts "Project wasmachien_block is not open"
      set make_assignments 0
   }
} else {
   # Only open if not already open
   if {[project_exists wasmachien_block]} {
      project_open -revision wasmachien_block wasmachien_block
   } else {
      project_new -revision wasmachien_block wasmachien_block
   }
   set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
   set_global_assignment -name COMPILER_SETTINGS wasmachien_block
   set_global_assignment -name SIMULATOR_SETTINGS wasmachien_block
   set_global_assignment -name SOFTWARE_SETTINGS wasmachien_block
   set_global_assignment -name FMAX_REQUIREMENT 0.1MHz
   set_global_assignment -name FAMILY "max ii"
   set_global_assignment -name TOP_LEVEL_ENTITY wasmachien_block
   set_global_assignment -name DEVICE epm1270f256c5es
   set_global_assignment -name USE_COMPILER_SETTINGS wasmachien_block
	set_global_assignment -name VHDL_FILE "C:/Project-digitale-besturing/Codes/Wasmachine/Wasmachine/hdl/master_master.vhd" 
	set_global_assignment -name VHDL_FILE "C:/Project-digitale-besturing/Codes/Wasmachine/Wasmachine/hdl/trommel_trommel.vhd" 
	set_global_assignment -name VHDL_FILE "C:/Project-digitale-besturing/Codes/Wasmachine/Wasmachine/hdl/wassen_wassen.vhd" 
	set_global_assignment -name VHDL_FILE "C:/Project-digitale-besturing/Codes/Wasmachine/Wasmachine/hdl/verwarming_verwarming.vhd" 
	set_global_assignment -name VHDL_FILE "C:/Project-digitale-besturing/Codes/Wasmachine/Wasmachine/hdl/afpompen_afpompen.vhd" 
	set_global_assignment -name VHDL_FILE "C:/Project-digitale-besturing/Codes/Wasmachine/Wasmachine/hdl/toevoer_toevoer.vhd" 
	set_global_assignment -name VHDL_FILE "C:/Project-digitale-besturing/Codes/Wasmachine/Wasmachine/hdl/wasmachien_block_struct.vhd" 


   # Commit assignments
   export_assignments


   # Close project
   if {$need_to_close_project} {
      project_close
   }
}

