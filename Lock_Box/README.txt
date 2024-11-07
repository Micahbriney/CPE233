Lock Box
The Lock Box circuit utilizes a four-bit input and a one-bit output. The inputs 
which unlock the lock box: 5, 6, 7, 9, 10, 11, 13, 14, 15, are given to us. Use 
these outputs and the four-bit input to build a truth table. The truth table 
shows that there are 9 product terms and 8 sum terms. 
Next use the product and sum terms to make the Sum of Products Boolean equation.
The initial equation contained 36 literals and was tedious to input into the 
design file. So, I used a k-map to simplify the SOP equation. This gave us a 
Product of Sums equation with two sum terms, one product term and 4 literals.
Next I defined the variables and assigned our simplified equation in our 
design sources file. Lastly, I created test cases using a for loop to test the 
Lock Box device.