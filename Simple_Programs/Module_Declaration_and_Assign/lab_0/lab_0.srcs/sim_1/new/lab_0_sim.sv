`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bridget Benson
// 
// Create Date: 08/29/2018 05:20:04 PM
// Module Name: Lab0Sim
// Description: Test Bench Template
// 
//////////////////////////////////////////////////////////////////////////////////


module lab_0_sim; //no ports to test module

    //declare inputs and outputs to give to your module
    //can be the same names as the ports of the module under test
    logic A, B, C; 
    logic Q;
    
    //Instantiate your module undertest
    lab_0 lab_0_inst (  .A(A), .B(B), .C(C), .Q(Q)  );


    //list your test cases
    initial 
        begin
        A = 0; B = 0; C = 0;
        #10
        
        A = 0; B = 0; C = 1;
        #10
       
       //add more test cases     
           
            
        $display("Finished");  
      end                                 
    
endmodule