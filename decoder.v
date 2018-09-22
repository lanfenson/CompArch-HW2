// Decoder circuit
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


//module AND_AND (out,a0,a1,enable);
module AND_AND
(
    output out,
    input a0, a1,
    input enable
);

    wire not_out;

    `AND andgate1(not_out,a0,a1);
    `AND andgate2(out,enable,not_out);

endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    wire naddress0, naddress1;

    `NOT address0inv(naddress0,address0);
    `NOT address1inv(naddress1,address1);

    AND_AND output0(out0,naddress0,naddress1,enable);
    AND_AND output1(out1,address0,naddress1,enable);
    AND_AND output2(out2,naddress0,address1,enable);
    AND_AND output3(out3,address0,address1,enable);

endmodule

