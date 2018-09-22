// Decoder testbench
`timescale 1 ns / 1 ps
`include "decoder.v"

module testDecoder (); 

    reg address0, address1;
    reg enable;
    wire out0,out1,out2,out3;
    wire naddress0,naddress1;

    //behavioralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable);
    structuralDecoder decoder (out0,out1,out2,out3,address0,address1,enable); // Swap after testing
    //structuralDecoder decoder ( .out0(o0), .out1(o1), .out2(o2), .out3(o3), .address0(adress0), 

    initial begin
    $dumpfile("decoder.vcd");
    $dumpvars();
    $display("En A0 A1| O0 O1 O2 O3 | Expected Output");
    enable=0;address0=0;address1=0; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, address0, address1, out0, out1, out2, out3);
    enable=0;address0=1;address1=0; #1000
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, address0, address1, out0, out1, out2, out3);
    enable=0;address0=0;address1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, address0, address1, out0, out1, out2, out3);
    enable=0;address0=1;address1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, address0, address1, out0, out1, out2, out3);
    enable=1;address0=0;address1=0; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O0 Only", enable, address0, address1, out0, out1, out2, out3);
    enable=1;address0=1;address1=0; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O1 Only", enable, address0, address1, out0, out1, out2, out3);
    enable=1;address0=0;address1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O2 Only", enable, address0, address1, out0, out1, out2, out3);
    enable=1;address0=1;address1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O3 Only", enable, address0, address1, out0, out1, out2, out3);
    $finish();
    end

endmodule
