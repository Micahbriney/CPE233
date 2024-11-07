`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Micah Briney
// 
// Create Date: 10/23/2019 06:50:25 PM
// Design Name: 
// Module Name: v_chk_sim
// Project Name: 
// Target Devices: 
// Description: Sim file to check all inputs and outputs
// 
//////////////////////////////////////////////////////////////////////////////////


module v_chk_sim(

    );
    logic A, B, S;
    logic V;
    
    v_chk v_chk_inst( .*); 
             
    initial
        begin
            for(int i = 0; i < 8; i++)begin
                A = i[2:2]; B = i[1:1]; S = i[0:0]; #10;    
        end
    end
endmodule
