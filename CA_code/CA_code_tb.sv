`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Tzu-Chiao Lin
// 
// Create Date: 01/01/2024 11:37:32 PM
// Design Name: 
// Module Name: CA_code_tb
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

module CA_code_tb;
    reg rst, clk;
    reg [5:0] prn_select;
    wire ca_code;

    // Instantiate the CA_code module
    CA_code uut (
        .rst(rst),
        .clk(clk),
        .prn_select(prn_select),
        .ca_code(ca_code)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test scenario
    initial begin
        // Initialize inputs
        rst = 1;
        prn_select = 1;

        // Apply some test vectors
        #10 rst = 0; // Assert reset

        // Wait for a few clock cycles
        #20;

        // Deassert reset and observe the behavior
        rst = 0;
        
        #10;
        rst = 0;

        // Monitor signals
        $monitor("Time=%0t rst=%b prn_select=%b clk=%b ca_code=%b", $time, rst, prn_select, clk, ca_code);

        // Run the simulation for some time
        #100;
        prn_select = 2;
        #10;
        rst = 1;
        #10;
        rst = 0;
        #120;
        
        prn_select = 19;
        rst = 1;
        #10;
        rst = 0;
        #120;
        // Finish the simulation
        $finish;
    end

endmodule