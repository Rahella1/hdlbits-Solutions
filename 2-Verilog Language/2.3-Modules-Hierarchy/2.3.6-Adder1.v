module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

    // Wire to carry the carry-out from the lower adder to the upper adder
    wire cout_lower;

    // Lower 16-bit adder:
    // Takes lower bits a[15:0] and b[15:0], cin is fixed to 0
    add16 adder_lower (
        .a   (a[15:0]),
        .b   (b[15:0]),
        .cin (1'b0),
        .sum (sum[15:0]),
        .cout(cout_lower)
    );

    // Upper 16-bit adder:
    // Takes upper bits a[31:16] and b[31:16], cin is the cout from lower adder
    add16 adder_upper (
        .a   (a[31:16]),
        .b   (b[31:16]),
        .cin (cout_lower),
        .sum (sum[31:16]),
        .cout() // Carry-out is ignored as per instructions
    );

endmodule