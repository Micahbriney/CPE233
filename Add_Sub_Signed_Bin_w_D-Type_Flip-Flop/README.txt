This circuit continues the development of the of the signed binary addition and 
subtraction from the previous two labs. The seven-segment display made from the 
previous lab was replaced with an eight-segment display. This new module shows 
the subtraction sign on the 2nd anode from the right when a negative output is 
displayed. This also replaced the need for an LED to represent a negative 
output. I also added D-type synchronous flip-flop registers to the circuit. Three different registers were 
used for the validity checker, sign of RCA result and the value of the RCA 
result. To display the negative sign and overflow as four dashes a universal 
segment display was provided. With the introductions of registers came the 
concept of clocks and synchronous registers. Since the register is synchronous 
the output Q is only set to D when en = 1 on the rising edge of the clock. This 
occur when the clock changes from 0 to 1. There was also the concept of bus 
mismatch between components that was explored.

The register used in lab 5 was a d-type synchronous rising edge triggered 
flip-flop. It uses five inputs and one output Q. The inputs consist of the clock 
which switches between 1 and 0. If enable is 1 on the rising edge of the clock, 
which is when the clock switches from 0 to 1, then Q is set to D. Reset is used 
to set Q = 0. In the case of the validity checker set will be equal to the reset 
and reset will be grounded. So when reset is clicked set will be = 1 and reset 
will be grounded to zero. This will allow for the left most anode to be turned 
off when reset is pressed.

Top Level:
In the top level there are 6 inputs and 2 outputs. The 6 inputs consist of two 
4-bit inputs A and B and four 1-bit inputs en, clr, clk, and sub. The inputs A, 
B and sub are used by the RCA and mux to perform addition and subtracts of 
signed binary. The clk is used by the D-type Flip-Flop to create a synchronous 
circuit. Enable is used as a control to set Q = D when enable is 1 on the rising 
edge of the clock. The input clr is used to reset the value of Q. This is 
required because the flip flop is a register and will continue to hold on to the 
value of Q until other conditions are met. The outputs seg and an are used to 
display the value of the RCA and control which anodes will be on or off.