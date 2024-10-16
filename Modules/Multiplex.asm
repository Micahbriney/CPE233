.data
sseg: 	.space 10 					# Save space for 10-byte lookup table

.text
		lut:
		la 		x10, sseg 			# load base address of data segment
		li 		x11,0x03 			# put 7-segment ‘0’ into register
		sb 		x11,0(x10) 			# store ‘0’ 7-seg at first LUT location
		li 		x11,0x9F 			# etc.
		sb 		x11,1(x10)
		li 		x11,0x25
		sb 		x11,2(x10)
		li 		x11,0x0D
		sb 		x11,3(x10)
		li 		x11,0x99
		sb 		x11,4(x10)
		li 		x11,0x49
		sb 		x11,5(x10)
		li 		x11,0x41
		sb 		x11,6(x10)
		li 		x11,0x1F
		sb 		x11,7(x10)
		li 		x11,0x01
		sb 		x11,8(x10)
		li 		x11,0x09
		sb 		x11,9(x10)
 
init: 
		li		x25, 0x1100C004		#segment port addr
		li		x26, 0x1100C008		#anode port addr
			
		la		x6, ISR				#load ISR addr
		csrw	x6, 0x305			#storing ISR addr in mtvec
		
		mv		x8, x0				#use as interrupt flag
		mv		x20, x0				#use as anode flag	
		li		x9, 0x1				#set value in x9
		
		mv		x15, x0				#initialize 1's place counter
		mv		x16, x0				#initialize 10's place counter
		
		csrw	x9, 0x304			#enable interrupts
 	
main:	beq 	x8, x9, intr		#check for interrupt
		call 	multiplex			#segement multiplex subroutine
		call	delay_ff			#given delay subroutine
		j		main				#
	
	
intr:	mv		x8, x0				#resets interrupt flag
		call	count_update		#foreground task, updates counts
		csrw	x9, 0x304			#enable interrupts
		j		main				#jump	
 
################################################ 
# The ISR sets the bit in x8 to flag task code
################################################
 ISR:	mv	x8, x9		#sets interrupt flag
		mret
################################################ 	
 	
#get data from wrapper file
 	
#------------------------------------------------------------
# Subroutine: multiplex
#
# Modular multiplexing algorithm for seven segment display
#
# tweaked registers: 
#------------------------------------------------------------

multiplex:
	
			li		x30, 0x3		#value to turn off anodes
			sb		x30, 0(x26)		#turns off all anodes
			mv		x11, x10		#creates copy of x10 to change
			bne		x20, x9, tens	#
	
ones:		add		x11, x11, x15	#adds 1's digit value to LUT addr
			lb		x21, 0(x11)		#load 1's place segment data
			j		m_done			#
	
tens:		add		x11, x11, x16	#adds 1's digit value to LUT addr
			lb		x21, 4(x11)		#load 10's place segment data

m_done:		sb		x21, 0(x25)		#output to segments
			sb		x20, 0(x26)		#turn on appropriate anode
			xori	x20, x20, 0x3	#toggle anode flag
			ret						#exit subroutine			
#-------------------------------------------------------------			


		

#------------------------------------------------------------
# Subroutine: delay_ff
#
# Delays for a count of FF. Unknown how long that is but it
# is plenty of time for display multiplexing
#
# tweaked registers: x31
#------------------------------------------------------------

delay_ff:

			li 		x31,0xFF 		# load count
loop: 		beq 	x31,x0,done 	# leave if done
			addi 	x31,x31,-1 		# decrement count
			j 		loop 			# rinse, repeat
done: 		ret 					# leave it all behind

#-------------------------------------------------------------- 


#------------------------------------------------------------
# Subroutine: count_update
#
# Updates count of interrupts to output the correct sseg values
#
# tweaked registers: 
#------------------------------------------------------------	
 	
count_update:

			li		x5, 9			#1's place limit
			li		x6, 4			#10's place limit
			blt		x15, x5, lt_9	#checks if 1's place is max
			mv		x15, x0			#resets 1's place
			blt		x16, x6, lt_4	#checks if 10's address is max
			mv		x16, x0			#resets 10's place
			ret						#returns
	
lt_9:		addi	x15, x15, 1		#increments 1's place
			ret

lt_4:		addi	x16, x16, 1		#increments 10's place
			ret								

#-------------------------------------------------------------
