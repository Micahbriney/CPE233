`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bridget Benson 
// Create Date: 10/29/2018 07:31:15 PM
// Description: Shows how to write an FSM
//////////////////////////////////////////////////////////////////////////////////

module FSM(
    input CLK,
    input bt0,
    input X,
    output logic Z
    );
    
    
    //assign bit values to your states
    //again the size should be log2(number of states)
    parameter [2:0] START = 0, ST1 = 1, ST2 = 2, ST3 = 3, ST4 = 4, ST5 = 5, ST6 = 6;
    parameter [2:0] ST11 = 1, ST22 = 2, ST33 = 3, ST44 = 4, ST55 = 5, ST66 = 6; 
    //sequential logic to change states
	
	
    //declare present state (PS) and next state (NS) variables to
    //be the size of log2(number of states)
    //initialize PS to the beginning state
	
    logic [2:0] NS;
    logic [2:0] PS = START;

    always_ff @ (posedge CLK)
    begin
        PS = NS;
    end
    
    //combinatorial logic 
    always_comb 
    begin
    //initialze all outputs to zero
    Z = 0;
    if (bt0 == 0)
    begin
        case (PS)
        START:
        begin
            Z = 0; //Z outputs depend only on state
                
            if (X == 0) //Not sure how X works yet... setting it to mimic sequence
                begin
                    NS = ST1;
                end
            else
                begin
                    NS = START;
                end
        end
         
        ST1:
         begin
            Z = 0;  
            if (X == 1)
                begin
                    NS = ST2;
                end
            else
                begin
                    NS = ST1;
                end
            end
         
        ST2:
        begin
            Z = 0;
                
            if (X == 1)
                begin
                    NS = ST3;
                end
            else
                begin
                    NS = ST1;
                end
            end
         
        ST3:
            begin
                Z = 0;
                
                if (X == 0)
                    begin
                        NS = ST4;
                    end
                else
                    begin
                        NS = START;
                    end
                end
        
        ST4:
            begin
                Z = 0;
                
                if (X == 0)
                    begin
                        NS = ST5;
                    end
                else
                    begin
                        NS = ST2;
                    end
                end
                  
        ST5:
            begin
                Z = 0;
                
                if (X == 1)
                    begin
                        NS = ST6;
                    end
                else
                    begin
                        NS = ST1;
                    end
                end
            
        ST6:
            begin
                Z = 1;
                
                if (X == 0)
                    begin
                        NS = ST1;
                    end
                else
                    begin
                        NS = START;
                    end
            end    
                        
        endcase      
    end       
    else
    begin
        case (PS)
        START:
        begin
            Z = 0;
            
            if(X == 0)
                begin
                    NS = ST11;
                end
            else
                begin
                    NS = START;
                end
        end
        
        ST11:
        begin
            Z = 0;
            
            if(X == 1)
                begin
                    NS = ST22;
                end
            else
                begin
                    NS = ST11;
                end
        end
        
        ST22:
        begin
            Z = 0;
            
            if(X == 1)
                begin
                    NS = ST33;
                end
            else
                begin
                    NS = ST11;
                end
        end
            
        ST33:
        begin
            Z = 0;
            
            if(X == 1)
                begin
                    NS = ST44;
                end
            else
                begin
                    NS = ST11;
                end
        end
        
        ST44:
        begin
            Z = 0;
            
            if(X == 0)
                begin
                    NS = ST55;
                end
            else
                begin
                    NS = START;
                end
        end
        
        ST55:
        begin
            Z = 0;
            
            if(X == 1)
                begin
                    NS = ST66;
                end
            else
                begin
                    NS = ST11;
                end
        end
        
        ST66:
        begin
            Z = 1;
            
            if(X == 0)
                begin
                    NS = ST11;
                end
            else
                begin
                    NS = START;
                end
        end
    endcase
    end
end
endmodule