
m
Command: %s
53*	vivadotcl2<
(write_bitstream -force OTTER_Wrapper.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
�Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px� 
�
YReport rule limit reached: REQP-1839 rule limit reached: 20 violations have been found.%s*DRC29
 !DRC|DRC System|Rule limit reached2default:default8ZCHECK-3h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "�
9Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[10]9Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[10]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[5]Otter_MCU/OTTER_MEMORY/Q[5]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[7]	 Otter_MCU/MCU_PC/data_out_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "�
9Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[11]9Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[11]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[6]Otter_MCU/OTTER_MEMORY/Q[6]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[8]	 Otter_MCU/MCU_PC/data_out_reg[8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "�
9Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[12]9Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[12]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[7]Otter_MCU/OTTER_MEMORY/Q[7]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[9]	 Otter_MCU/MCU_PC/data_out_reg[9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "�
9Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[13]9Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[13]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[8]Otter_MCU/OTTER_MEMORY/Q[8]2default:default2default:default2p
 "Z
!Otter_MCU/MCU_PC/data_out_reg[10]	!Otter_MCU/MCU_PC/data_out_reg[10]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "�
9Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[14]9Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[14]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[9]Otter_MCU/OTTER_MEMORY/Q[9]2default:default2default:default2p
 "Z
!Otter_MCU/MCU_PC/data_out_reg[11]	!Otter_MCU/MCU_PC/data_out_reg[11]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "�
8Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[5]8Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[5]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[0]Otter_MCU/OTTER_MEMORY/Q[0]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[2]	 Otter_MCU/MCU_PC/data_out_reg[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "�
8Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[6]8Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[6]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[1]Otter_MCU/OTTER_MEMORY/Q[1]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[3]	 Otter_MCU/MCU_PC/data_out_reg[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "�
8Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[7]8Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[7]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[2]Otter_MCU/OTTER_MEMORY/Q[2]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[4]	 Otter_MCU/MCU_PC/data_out_reg[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "�
8Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[8]8Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[8]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[3]Otter_MCU/OTTER_MEMORY/Q[3]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[5]	 Otter_MCU/MCU_PC/data_out_reg[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "�
8Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[9]8Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ADDRBWRADDR[9]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[4]Otter_MCU/OTTER_MEMORY/Q[4]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[6]	 Otter_MCU/MCU_PC/data_out_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "z
1Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ENBWREN1Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ENBWREN2default:default2default:default2�
 "n
+Otter_MCU/OTTER_MEMORY/memory_reg_bram_10_0+Otter_MCU/OTTER_MEMORY/memory_reg_bram_10_02default:default2default:default2p
 "Z
!Otter_MCU/MCU_PC/data_out_reg[12]	!Otter_MCU/MCU_PC/data_out_reg[12]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "z
1Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ENBWREN1Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ENBWREN2default:default2default:default2�
 "n
+Otter_MCU/OTTER_MEMORY/memory_reg_bram_10_0+Otter_MCU/OTTER_MEMORY/memory_reg_bram_10_02default:default2default:default2p
 "Z
!Otter_MCU/MCU_PC/data_out_reg[13]	!Otter_MCU/MCU_PC/data_out_reg[13]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "z
1Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ENBWREN1Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ENBWREN2default:default2default:default2�
 "n
+Otter_MCU/OTTER_MEMORY/memory_reg_bram_10_0+Otter_MCU/OTTER_MEMORY/memory_reg_bram_10_02default:default2default:default2p
 "Z
!Otter_MCU/MCU_PC/data_out_reg[14]	!Otter_MCU/MCU_PC/data_out_reg[14]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_10	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_102default:default2default:default2�
 "z
1Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ENBWREN1Otter_MCU/OTTER_MEMORY/memory_reg_bram_10/ENBWREN2default:default2default:default2�
 "n
+Otter_MCU/OTTER_MEMORY/memory_reg_bram_10_0+Otter_MCU/OTTER_MEMORY/memory_reg_bram_10_02default:default2default:default2p
 "Z
!Otter_MCU/MCU_PC/data_out_reg[15]	!Otter_MCU/MCU_PC/data_out_reg[15]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_11	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_112default:default2default:default2�
 "�
9Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[10]9Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[10]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[5]Otter_MCU/OTTER_MEMORY/Q[5]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[7]	 Otter_MCU/MCU_PC/data_out_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_11	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_112default:default2default:default2�
 "�
9Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[11]9Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[11]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[6]Otter_MCU/OTTER_MEMORY/Q[6]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[8]	 Otter_MCU/MCU_PC/data_out_reg[8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_11	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_112default:default2default:default2�
 "�
9Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[12]9Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[12]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[7]Otter_MCU/OTTER_MEMORY/Q[7]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[9]	 Otter_MCU/MCU_PC/data_out_reg[9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_11	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_112default:default2default:default2�
 "�
9Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[13]9Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[13]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[8]Otter_MCU/OTTER_MEMORY/Q[8]2default:default2default:default2p
 "Z
!Otter_MCU/MCU_PC/data_out_reg[10]	!Otter_MCU/MCU_PC/data_out_reg[10]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_11	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_112default:default2default:default2�
 "�
9Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[14]9Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[14]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[9]Otter_MCU/OTTER_MEMORY/Q[9]2default:default2default:default2p
 "Z
!Otter_MCU/MCU_PC/data_out_reg[11]	!Otter_MCU/MCU_PC/data_out_reg[11]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "j
)Otter_MCU/OTTER_MEMORY/memory_reg_bram_11	)Otter_MCU/OTTER_MEMORY/memory_reg_bram_112default:default2default:default2�
 "�
8Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[9]8Otter_MCU/OTTER_MEMORY/memory_reg_bram_11/ADDRBWRADDR[9]2default:default2default:default2d
 "N
Otter_MCU/OTTER_MEMORY/Q[4]Otter_MCU/OTTER_MEMORY/Q[4]2default:default2default:default2n
 "X
 Otter_MCU/MCU_PC/data_out_reg[6]	 Otter_MCU/MCU_PC/data_out_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 22 Warnings2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
d
Writing bitstream %s...
11*	bitstream2'
./OTTER_Wrapper.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px� 
�
�'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2o
[C:/Users/mjrbr/Limited_Otter_MCU/Limited_Otter_MCU.runs/impl_1/usage_statistics_webtalk.xml2default:default2,
Wed Feb 19 23:44:02 20202default:default2I
5C:/Xilinx/Vivado/2019.2/doc/webtalk_introduction.html2default:defaultZ17-186h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1202default:default2
432default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:132default:default2
00:00:132default:default2
2087.3712default:default2
417.8552default:defaultZ17-268h px� 


End Record