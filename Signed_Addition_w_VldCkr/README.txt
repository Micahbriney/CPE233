This circuit creates a simple calculator that can do the following:


1. Add and subtract 4-bit signed (2s compliment). Use the left most switch to 
indicate add/sub.
2. Display the output as a hex character on a seven-segment display if the 
output is valid, otherwise the display is off. A validity checker module was 
added so that it will output a ‘1’ when a result is valid. Also, I modified my 
previously designed RCA to have four full-adders to perform a 2’s compliment 
operation.
The top level module works according to the following inputs and outputs:
4-bit inputs A and B (connected to switches)
1-bit input Sub (connected to left most switch)
7-bit output seg (connected to seg)
4-bit output an (connected to an)
1-bit output neg (connected to an LED)
