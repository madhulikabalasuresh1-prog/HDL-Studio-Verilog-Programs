// Enter source text here
`timescale 1ns/1ps

module decoder2to4 (
    input A,
    input B,
    input Enable,
    output [3:0] Y
);

wire nA, nB;

not (nA, A);
not (nB, B);

and (Y[0], Enable, nA, nB);
and (Y[1], Enable, nA, B);
and (Y[2], Enable, A, nB);
and (Y[3], Enable, A, B);

endmodule


module decoder3to8 (
    input A,
    input B,
    input C,
    input Enable,
    output [7:0] Y
);

wire nA;

not (nA, A);

decoder2to4 D0 (
    .A(B),
    .B(C),
    .Enable(Enable & nA),
    .Y(Y[3:0])
);

decoder2to4 D1 (
    .A(B),
    .B(C),
    .Enable(Enable & A),
    .Y(Y[7:4])
);

endmodule