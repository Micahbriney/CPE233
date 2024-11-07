
Seven Segment Display:
The seven-segment display (SSD) design file is composed of a 4 to 7 bit decoder. 
The decoder has one 4-bit input, BCD, and one 7-bit output, seg. The input 
for the SSD comes from the Ripple Carry Adder’s (RCA) 4-bit output, Sum. The 
temporary variable BCD in the Lab_03_BB’s design file is used to connect the 
two. The SSD’s 4-bit input is used in a case statement. The case statement will 
execute the first case that matches the expression. The expression used was the 
input bit value in base ten. There was a total of 16 cases ranging from 0 to 15. 
When the SSD’s input bit matched the case then the output bit was assigned with 
a value that represented the base 16 value of that input bit.
For the seven segments on the Basys3 board to be activated the anodes need to be 
in a low state. This means that a zero will activate the anode instead of a 1. 
To determine the output values that would activate the correct segments a truth 
table was used. The truth table helped to identify which binary output was 
required to display the input value as a hexadecimal on the seven-segment 
display. These binary values would by assigned to the output bit corresponding 
to their case which was the decimal representation of the input or sum value. 
The binary value was represented in the format 7’b#######. Where 7’b specifies 
that the value is seven binary digits in length. There is also a default case 
which displays 0 on the seven-segment display when none of the cases match the 
expression.

2:1 Multiplexer:
The multiplexer has three input bits and one output bit. The one input bit is 
the select bit. This is a 1-bit select wire which decides which of the other 
two input bits will be forwarded by the multiplexer. The value of the sel bit is 
comes from the RCA’s carry out bit, Cout. The Cout bit is connected to the sel 
bit with the temporary variable Sel in the Lab_03_BB design file. When the sel 
bit is zero then the output bit, mux_out, is assigned the value 4’b1110. This 
value assigns the three right most anodes on the Basys3 board to 1 and the 
fourth anode to 0. With 0 being high voltage this means that only the right most 
anode will be illuminated. When the sel bit has a value of 1 then the one input 
bit is used. With a value of 4’b1111 the right most anode, along with the other 
three anodes, are set to 1 and turned off.

Top Level:
The top-level structural model has two input bits and two output bits. Each 
input bit, A and B, is 4 bits while the segment display output, Seg, is 7 bits 
and the anode output, AN, is 4 bits. The goal of this lab was to perform binary 
addition. To do this the input bits of A and B have their values added together. 
The RCA utilized a half adder and three full adders to sum the binary value of 
each bit of input A and input B. Any sum between 0 and 15 would be displayed on 
the Basys3 board’s seven segment display as a hex value. If the Seg output had a 
value over 15 then the seven-segment display would turn off. The output AN would 
determine whether the first segment display was turned on or off. The AN output 
was controlled by the multiplexer. When the Cout bit from the RCA is 1 the sel 
bit of the Mux allows the one input to be used. This sets the value of the 
mux_out, or AN, bit to 4’b1111 and turns all of the anodes off.