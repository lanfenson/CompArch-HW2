// Adder circuit
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule


module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire out1,out2,out3;

    `XOR xor1(out1,a,b);
    `XOR xor2(sum,out1,carryin);

    `AND and1(out2,out1,carryin);
    `AND and2(out3,a,b);

    `OR or1(carryout,out2,out3);

endmodule
