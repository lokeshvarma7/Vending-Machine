//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Pulipat Lokesh Varma
// 
// Create Date: 26.05.2025 20:25:01
// Design Name: 
// Module Name: vending_machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module vending_machine(
clk,rst,change,dispense,coin_in
    );
    input clk,rst;
    input [1:0]coin_in;
    reg [1:0]cs,ns;
    parameter S0=2'd0,S1=2'd1,S2=2'd2,S3=2'd3;
    output reg [1:0]change;
    output reg dispense;
    reg [2:0]coin_value;
    always@(posedge clk or posedge rst)begin
        if(rst)begin                        //01= for 5 rupees
            cs<=S0;                         // 10= for 10 rupees
        end else begin                      // 11 for 15 rupees
            cs<=ns;
        end    
    
    end
    always@(posedge clk)begin
        
        case(cs)            
            2'b00: begin
                coin_value<=coin_in;
              if(coin_in==2'd0)begin // if there is coin inserted  
               //     change<=2'd0;
                    change<=2'd0;
                    dispense<=2'd0;
                    coin_value<=3'd0;
                ns<=S0;
                end
              else if(coin_in==2'd1)begin // if the coin inserted is 5 rs go to second state
                    ns<=S1;
                   // coin_value<=2'd0 
              end  
              else if(coin_in==2'd2)begin
                    ns<=S2;
                 //   coin_value<=2'd0;
              end
            end
            2'b01: begin
                 if(coin_in==2'd0 && coin_value==2'd1)begin // if there is coin inserted  
                               change<=2'd1;
                                dispense<=1'b0;
                                ns<=S0;
                  end
                   else if(coin_in==2'd1 && coin_value==2'd1)begin // if the coin inserted is 5 rs go to third state
                                    ns<=S2;
                                
                                   coin_value<=coin_value+coin_in;
                    end  
                     else if(coin_in==2'd2 && coin_value==2'd1)begin
                                       ns<=S3;
                             
                                    coin_value<=coin_value+coin_in;
                                 end
            end
            2'b10: begin
                
                 if(coin_in==2'd0 && coin_value==2'd2)begin // if there is coin inserted  
                                          change<=2'd2;
                                           dispense<=1'b0;
                                          ns<=S0;                                         
                                         
                             end
                              else if(coin_in==2'd1 && coin_value==2'd2)begin // if the coin inserted is 5 rs go to third state
                                               ns<=S3;
                                               coin_value<=coin_value+coin_in;
                                        
                               end  
                                else if(coin_in==2'd2 && coin_value==2'd2)begin
                                                coin_value<=coin_value+coin_in;
                                                  ns<=S3;
                                           
                                            end
            end           
            2'b11:begin
                if(coin_value==2'd3)begin
                    ns<=S0;
                    change<=2'd0;
                    dispense<=1'b1;
                end else if(coin_value==3'd4)begin
                    ns=S0;
                    change<=2'd1;
                    dispense<=1'b1;
                end
                
            
            end
        endcase
    
    end
    
    
    
endmodule
