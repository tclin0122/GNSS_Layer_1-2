`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Tzu-Chiao Lin
// 
// Create Date: 01/01/2024 11:12:45 PM
// Design Name: 
// Module Name: CA_code
// Project Name: GNSS
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


module CA_code(
    input rst, clk,
    input [5:0] prn_select,
    output ca_code
    );
    
    logic [0:9] G1, G2;
    logic flag = 0;
    logic out, g1, g2;
    logic G2_gen;
    
    ///*
    
    always_comb begin
        case (prn_select)
            6'd01: G2_gen = G2[1]^G2[5];
            6'd02: G2_gen = G2[2]^G2[6];
            6'd03: G2_gen = G2[3]^G2[7];
            6'd04: G2_gen = G2[4]^G2[8];
            6'd05: G2_gen = G2[0]^G2[8];
            6'd06: G2_gen = G2[1]^G2[9];
            6'd07: G2_gen = G2[0]^G2[7];
            6'd08: G2_gen = G2[1]^G2[8];
            
            6'd09: G2_gen = G2[2]^G2[9];
            6'd10: G2_gen = G2[1]^G2[2];
            6'd11: G2_gen = G2[2]^G2[3];
            6'd12: G2_gen = G2[4]^G2[5];
            6'd13: G2_gen = G2[5]^G2[6];
            6'd14: G2_gen = G2[6]^G2[7];
            6'd15: G2_gen = G2[7]^G2[8];
            6'd16: G2_gen = G2[8]^G2[9];
            
            6'd17: G2_gen = G2[0]^G2[3];
            6'd18: G2_gen = G2[1]^G2[4];
            6'd19: G2_gen = G2[2]^G2[5];
            6'd20: G2_gen = G2[3]^G2[6];
            6'd21: G2_gen = G2[4]^G2[7];
            6'd22: G2_gen = G2[5]^G2[8];
            6'd23: G2_gen = G2[0]^G2[2];
            6'd24: G2_gen = G2[3]^G2[5];
            
            6'd25: G2_gen = G2[4]^G2[6];
            6'd26: G2_gen = G2[5]^G2[7];
            6'd27: G2_gen = G2[6]^G2[8];
            6'd28: G2_gen = G2[7]^G2[9];
            6'd29: G2_gen = G2[0]^G2[5];
            6'd30: G2_gen = G2[1]^G2[6];
            6'd31: G2_gen = G2[2]^G2[7];
            6'd32: G2_gen = G2[3]^G2[8];
            default: G2_gen = 'X;
        endcase
    end
    //*/
    always_ff @(posedge clk) begin
        if (rst) begin
            G1 = 10'b1111111111;
            G2 = 10'b1111111111;
            flag = 1'b1;
            out = G1[9]^G2_gen;
        end
        else if(flag && !rst) begin
            g1 = G1[2]^G1[9];
            g2 = G2[1]^G2[2]^G2[5]^G2[7]^G2[8]^G2[9];
            out = G1[9]^G2_gen;
            G1 = G1 >> 1;
            G2 = G2 >> 1;
            G1[0] = g1;
            G2[0] = g2;
        end
    end
    assign ca_code = out;
    
endmodule