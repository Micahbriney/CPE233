Ripple carry adders are made up of half adders and full adders. Half adders 
which takes two 1-bit inputs, A and B and delivers two outputs, Sum and Cout 
(carry out). A full adder has 3 inputs, A, B and Cin and 2 outputs, 
Sum and Cout. The input Cin (carry in) accepts input from a temporary variable 
which stores the carry out output bit from the former full or half adder 
circuit.

The RCA includes 1 half adder and 3 full adders. The RCA takes in two 4-bit 
inputs, A and B, and produces two outputs, Sum (4 bit) and Cout. The first 
operation occurs with the half adder. The half adder uses the least significant 
bit (LSB) of each input, A[0:0] and B[0:0], and adds them together. The half 
adder produces two outputs, Cout and Sum[0:0]. The carry out bit, Cout, is used 
by the first full adder’s carry in bit, Cin. The first full adder also uses the 
input of the 2nd bit of the 4-bit inputs A and B. After the first full adder 
circuit performs its function with the 3 inputs, which are Cin, A[1:1] and 
B[1:1] it produces 2 outputs, Sum[1:1] and Cout. The full adder process occurs a 
total of three times and results in two outputs Sum[3:0] and Cout.
 
