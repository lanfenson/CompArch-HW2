// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();

  reg address0, address1;
  reg in0, in1, in2, in3;
  wire naddress0, naddress1;
  wire out0, out1, out2, out3;
  wire out;

  //behavioralMultiplexer multiplexer (out,in0,in1,in2,in3,address0,address1);
  structuralMultiplexer multiplexer (out,out0,out1,out2,out3,address0,address1,in0,in1,in2,in3);

    initial begin
    $dumpfile("multiplexer.vcd");
    $dumpvars();
    $display("A0 A1 In0 In1 In2 In3 | Out | Expected Output");
    address0=0;address1=0;in0=0;in1=0;in2=0;in3=0; #1000 
    $display("%b  %b  %b   %b   %b   %b   |  %b  | 0 (Follows In0)", address0, address1, in0, in1, in2, in3, out);
    address0=0;address1=0;in0=1;in1=0;in2=0;in3=0; #1000
    $display("%b  %b  %b   %b   %b   %b   |  %b  | 1 (Follows In0)", address0, address1, in0, in1, in2, in3, out);
    address0=0;address1=1;in0=0;in1=0;in2=0;in3=0; #1000 
    $display("%b  %b  %b   %b   %b   %b   |  %b  | 0 (Follows In1)", address0, address1, in0, in1, in2, in3, out);
    address0=0;address1=1;in0=0;in1=1;in2=0;in3=0; #1000 
    $display("%b  %b  %b   %b   %b   %b   |  %b  | 1 (Follows In1)", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=0;in0=0;in1=0;in2=0;in3=0; #1000 
    $display("%b  %b  %b   %b   %b   %b   |  %b  | 0 (Follows In2)", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=0;in0=0;in1=0;in2=1;in3=0; #1000 
    $display("%b  %b  %b   %b   %b   %b   |  %b  | 1 (Follows In2)", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=1;in0=0;in1=0;in2=0;in3=0; #1000 
    $display("%b  %b  %b   %b   %b   %b   |  %b  | 0 (Follows In3)", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=1;in0=0;in1=0;in2=0;in3=1; #1000 
    $display("%b  %b  %b   %b   %b   %b   |  %b  | 1 (Follows In3)", address0, address1, in0, in1, in2, in3, out);
    $finish();
    end
endmodule
