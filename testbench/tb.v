`timescale 1ns/1ps

module tb;

    reg clk;
    reg reset;
    reg [31:0] instr;

    wire [31:0] pc;
    wire [31:0] result;

    top_module dut (
        .clk(clk),
        .reset(reset),
        .instr(instr),
        .result(result),
        .pc(pc)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        instr = 32'h00000013;  // NOP

        #20;
        reset = 0;

        #50;
        instr = 32'h00100093;  // ADDI x1,x0,1

        #50;
        instr = 32'h00200113;  // ADDI x2,x0,2

        #50;
        instr = 32'h002081B3;  // ADD x3,x1,x2

        #100;
        $finish;
    end

    initial begin
        $monitor("Time=%0t Reset=%0b Instr=%h PC=%h Result=%h",
                 $time, reset, instr, pc, result);
    end

endmodule
