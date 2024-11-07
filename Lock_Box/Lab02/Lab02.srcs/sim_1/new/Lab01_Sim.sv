`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Micah Briney
// 
// Create Date: 10/04/2019 12:50:00 AM
// Module Name: Lab02_Sim
// Description: Lab01 Simulation File
// 
//////////////////////////////////////////////////////////////////////////////////


module Lab02_Sim; //no ports to test module

    //declare inputs and outputs to give to your module
    //can be the same names as the ports of the module under test
    logic A, B, C, D; 
    logic F;
    
    //Instantiate your module undertest
    Lab02 Lab02_inst (  .A(A), .B(B), .C(C), .D(D), .F(F)  );


    //list your test cases
    initial 
        begin

//--------Original Test Cases before for loop

//        A = 0;  B = 0;  C = 0;  D = 0;  #10       
//        A = 0;  B = 0;  C = 0;  D = 1;  #10
//        A = 0;  B = 0;  C = 1;  D = 0;  #10
//        A = 0;  B = 0;  C = 1;  D = 1;  #10
//        A = 0;  B = 1;  C = 0;  D = 0;  #10
//        A = 0;  B = 1;  C = 0;  D = 1;  #10
//        A = 0;  B = 1;  C = 1;  D = 0;  #10
//        A = 0;  B = 1;  C = 1;  D = 1;  #10
//        A = 1;  B = 0;  C = 0;  D = 0;  #10
//        A = 1;  B = 0;  C = 0;  D = 1;  #10
//        A = 1;  B = 0;  C = 1;  D = 0;  #10
//        A = 1;  B = 0;  C = 1;  D = 1;  #10
//        A = 1;  B = 1;  C = 0;  D = 0;  #10
//        A = 1;  B = 1;  C = 0;  D = 1;  #10
//        A = 1;  B = 1;  C = 1;  D = 0;  #10
//        A = 1;  B = 1;  C = 1;  D = 1;  #10

//-----Test cases generated using a for loop

for (int i = 0; i<16; i++)begin
    A = i[3:3];  B = i[2:2];  C = i[1:1];  D = i[0:0];  #10;
end
       //add more test cases     
           
            
        $display("Finished");  
      end                                 
    
endmodule