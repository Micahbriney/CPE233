//////////////////////////////////////////////////////////////////////////////////
// Engineer: Micah Briney
// 
// Create Date: 10/28/2019 07:26:31 PM
// Module Name: Lab_05
// Project Name: Lab_05
// Description: Top level sim
//////////////////////////////////////////////////////////////////////////////////

module Lab_05_Sim();

    logic [3:0] A, B;
    logic en, clr, clk, sub;
    logic [7:0] seg;
    logic [3:0] an;
    
    Lab_05 Lab_05_inst( .*);
    
    always
        begin
            clk = 1; #5;
            clk = 0; #5;
        end
        
    //test cases
    initial
    begin
        //test 1: Low. Subtract 7 - 7. Display reads "0"
        A = 7; clr = 0; sub = 1; B = 7; en = 1; #15;
        
        //test 2: Overload. Display should read "- - - -"
        A = 7; clr = 0; sub = 0; B = 7; en = 1; #10;
        
        //test 3: Clr button. Ignores new input. Display read "0"
        A = 3; clr = 1; sub = 0; B = 4; en = 0; #10;
        
        //test 4: Signed binary summation. Display read "7"
        A = 3; clr = 0; sub = 0; B = 4; en = 1; #10;
        
        //test 5: Signed binary summation. Display read "-1"
        A = 3; clr = 0; sub = 1; B = 4; en = 1; #10;
        
        //test 6: Signed binary summation. Display read "4"
        A = 0; clr = 0; sub = 0; B = 4; en = 1; #10;
        
        //test 7: Signed binary summation. Display read "-4"
        A = 0; clr = 0; sub = 1; B = 4; en = 1; #10;
        
        //test 8: Signed binary summation. Display read "-1"
        A = 0; clr = 0; sub = 1; B = 0; en = 1; #10;

                
    end
endmodule