module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

    wire cout_lower;

    // Instantiate lower 16 bits using the background add16 module
    add16 lower_add (
        .a   (a[15:0]),
        .b   (b[15:0]),
        .cin (1'b0),
        .sum (sum[15:0]),
        .cout(cout_lower)
    );

    // Instantiate upper 16 bits using the background add16 module
    add16 upper_add (
        .a   (a[31:16]),
        .b   (b[31:16]),
        .cin (cout_lower),
        .sum (sum[31:16]),
        .cout()
    );

endmodule

// Include add1 ONLY if the problem prompt explicitly asks you to build add1
module add1 (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule