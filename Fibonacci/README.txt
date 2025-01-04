Fibonacci

This circuit generates the first 16 numbers in the Fibonacci Sequence. The 
modular design includes foundational modules such as the up counter, RAM, 
FSM, mux, RCA, register and universal seven segment. The circuits cycle through 
the 16 addresses in memory generating the sum of the previous two numbers. Upon 
a button press, the sequence generator begins by creating separate states to 
load the first two values into the RCA. After initializing the first two values 
of the sequence a modified accumulator is used to add the current value to the 
previous value. When the counter asserted a high RCO the FSM returned to the 
display state in which it reset the counter and began displaying every value 
stored in memory on the seven segment display until the button reset the circuit.

For the first two digits (both ones), a mux is used to load 1s into an RCA 
that sends its output to the RAM. After that, the other option in the mux is 
selected. This one sends the outputs of two registers to the RCA, and then 
shifts the value of the first RCA to the second, effectively saving the two 
previous values. An up counter is used to tell the FSM when to stop loading 
values into the RAM module. The seven segment display module is receiving input 
directly from the RAM module. 

It takes 17 clock cycles to complete the task after the user presses the button. 
It takes one clock cycle per digit of the Fibonacci sequence. At that point, RCO 
would be set to high, which will send the FSM back to the display state on the 
next clock cycle.