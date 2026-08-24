module top_module (
    input [3:0] x, y,
    output [4:0] sum
);

    wire [3:0] c; // Internal carry signals: c[0] is bit 0 cout, c[1] is bit 1 cout, etc.

    // Bit 0: Initial carry-in is 0 (grounded)
    FA fa0 (x[0], y[0], 1'b0, c[0], sum[0]);

    // Bits 1 to 3: Carry output ripples to next carry-in
    FA fa1 (x[1], y[1], c[0], c[1], sum[1]);
    FA fa2 (x[2], y[2], c[1], c[2], sum[2]);
    FA fa3 (x[3], y[3], c[2], c[3], sum[3]);

    // sum[4] takes the final carry-out from the MSB stage
    assign sum[4] = c[3];

endmodule

// Full Adder Submodule
module FA (
    input a, b, cin,
    output cout, sum
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule