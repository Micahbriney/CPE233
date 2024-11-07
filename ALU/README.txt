ALU
The arithmetic logic unit (ALU) is a combinational digital circuit that performs 
arithmetic and bitwise operations on integer binary numbers. It has 3 inputs 
alu_fun, OP_1 and OP_2, and 1 output RESULT. OP_1 and OP_2 are 4 bit binary 
input operands. Alu_fun is the function that the ALU is going to perform on the 
two operands. RESULT is the result of the alu_fun that was performed on the two
operands.	

alu_fun operation
0101: >> 
(srl) Shifts op_1 right by the number specified in op_2 (up to 5 LSB's). 
Inserts 0's.

0001: <<
(sll) Shifts op_1 left by the number specified in op_2 (up to 5 LSB's). 
Inserts 0's.

0110: |
Bit-wise OR compares each bit in op_1 to each corresponding bit in op_2.

0111: &
Bit-wise AND compares each bit in op_1 to each corresponding bit in op_2.

0100: ^
Bit-wise XOR compares each bit in op_1 to each corresponding bit in op_2.

1001: <<
lui. 20 bits from op_1 is loaded into the upper 20 bits of result. Lower 12 bits 
are zeros.

0011: <
sltu. Result is 1 if op_1 < op_2. Else result is 0. Performes unsigned comparison

0000: +
add. Adds op_1 and op_2. Both are cast as signed values.

1000: -
sub. Subtracts op_1 from op_2. Both are cast as signed values.

1101: >>>
sra. Shifts op_1 right by the number specified in op_2 (up to 5 LSB's). Sign 
extends MSB.

0010: <
slt. Result is 1 if op_1 < op_2. Else result is 0. Performs signed comparison.