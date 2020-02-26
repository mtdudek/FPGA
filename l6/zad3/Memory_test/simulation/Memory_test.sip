set_global_assignment -entity "Memory_test" -library "lib_Memory_test" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "Memory_test" -library "lib_Memory_test" -name IP_TOOL_VERSION "19.1"
set_global_assignment -entity "Memory_test" -library "lib_Memory_test" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_Memory_test" -name SPD_FILE [file join $::quartus(sip_path) "../Memory_test.spd"]
set_global_assignment -library "lib_Memory_test" -name MISC_FILE [file join $::quartus(sip_path) "../../Memory_test.qsys"]

set_global_assignment -library "lib_Memory_test" -name MISC_FILE [file join $::quartus(sip_path) "Memory_test.v"]
