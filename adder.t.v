// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;
    wire out1,out2,out3;

    //behavioralFullAdder adder (sum, carryout, a, b, carryin);
    structuralFullAdder adder (sum,carryout,a,b,carryin);

    initial begin
    $dumpfile("adder.vcd");
    $dumpvars();
    $display("A B Cin | S Cout | Expected Output");
    a=0;b=0;carryin=0; #1000 
    $display("%b  %b  %b |  %b  %b  | Sum 0, Carryout 0", a, b, carryin, sum, carryout);
    a=0;b=1;carryin=0; #1000
    $display("%b  %b  %b |  %b  %b  | Sum 1, Carryout 0", a, b, carryin, sum, carryout);
    a=1;b=0;carryin=0; #1000 
    $display("%b  %b  %b |  %b  %b  | Sum 1, Carryout 0", a, b, carryin, sum, carryout);
    a=1;b=1;carryin=0; #1000 
    $display("%b  %b  %b |  %b  %b  | Sum 0, Carryout 1", a, b, carryin, sum, carryout);
    a=0;b=0;carryin=1; #1000 
    $display("%b  %b  %b |  %b  %b  | Sum 1, Carryout 0", a, b, carryin, sum, carryout);
    a=0;b=1;carryin=1; #1000 
    $display("%b  %b  %b |  %b  %b  | Sum 0, Carryout 1", a, b, carryin, sum, carryout);
    a=1;b=0;carryin=1; #1000 
    $display("%b  %b  %b |  %b  %b  | Sum 0, Carryout 1", a, b, carryin, sum, carryout);
    a=1;b=1;carryin=1; #1000 
    $display("%b  %b  %b |  %b  %b  | Sum 1, Carryout 1", a, b, carryin, sum, carryout);
    $finish();
    end
endmodule
