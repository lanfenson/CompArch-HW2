// Multiplexer circuit
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];

endmodule


module AND_AND
(
    output out,
    input a0, a1, in
);

    wire not_out;

    `AND andgate1(not_out,a0,a1);
    `AND andgate2(out,not_out,in);

endmodule


module structuralMultiplexer
(
    output out, out0, out1, out2, out3,
    input address0, address1,
    input in0, in1, in2, in3
);
    wire naddress0, naddress1;

    `NOT address0inv(naddress0,address0);
    `NOT address1inv(naddress1,address1);

    AND_AND output0(out0,naddress0,naddress1,in0);
    AND_AND oupput1(out1,naddress0,address1,in1);
    AND_AND output2(out2,address0,naddress1,in2);
    AND_AND output3(out3,address0,address1,in3);

    `OR finaloutput(out,out0,out1,out2,out3);

endmodule

