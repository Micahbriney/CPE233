Binary Multiplication w/ FSM
This circuit utilizes an FSM that provides both Moore and Mealy output. The 
purpose of the circuit is to perform multiplication of binary inputs. To perform 
this operation, I used shift registers. For multiplication one of the inputs is 
shifted to the left by one bit. This shift occurs when other input’s bit, at the 
same index greater than 0, is 1. An accumulator is also needed in the circuit to 
perform multiplication of the inputs. This accumulator will perform the 
summation step in the multiplication process. This summation step occurs at each 
state when the bit that causes the shift to occur is active. Otherwise the value 
stored in the resister will remain the same. Lastly the register value is 
displayed on the Basys3 board via a seven-segment module.

The FSM takes in 3 inputs clk (clock), en (enter) and a 4-bit input B. It also 
provides 3 outputs, acc_ld, acc_clr and a two-bit output sr_sel. The acc_ld and 
acc_clr are used by the accumulator to clear and add values passed to it by the 
shift register. The FSM has 6 states in total. The first state, hold, is the 
idle state. It only has Moore outputs which are all 0. The next state is start. 
When reaching this state the signal to clear the accumulator and load the shift 
register with the value provided by the top level input A. The following three 
states Bit_0, Bit_1, and Bit_2 make use of both Moore and Mealy outputs. The 
current state’s output tell the Shift Register to shift its stored output value 
by 1 bit to the left and then again store that value for the next states. The 
previously mentioned states also include Mealy outputs which tell the 
accumulator to load the output value provided by the shift register if the bit 
value of B specified is 1. Otherwise the value stored in the accumulator will 
remain the same. The last state is Bit_03 and this state performs one last 
Mealy output to sum the remaining value of input if the MSB of B is 1. 
Otherwise nothing is loaded. After this last conditional output the FSM 
returned to the hold state to await for the next time en is pressed.

Top Level:
In this circuit, there is a total of 4 inputs, namely clk (clock), en (enter), 
4-bit A and a 4-bit B. Outputs for this include a seven-segment display and 
an(anode). The circuit includes an FSM, a seven-segment display, a shift 
register, and an Accumulator. The FSM provides certain inputs for different 
elements of the circuit. The output on the seven-segment display provides 
multiplied results for inputs provided using the basis 3 board up to the number 
225. A and B are the inputs whose multiples are used for the final answers.