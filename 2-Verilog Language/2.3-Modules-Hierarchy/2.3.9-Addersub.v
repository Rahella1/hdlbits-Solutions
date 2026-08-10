module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
   // If sub = 0 -> 32'b0000...0000
    //If sub = 1 -> 32'b1111...1111
    wire [31:0]b_xor = b^{32{sub}};
    wire cout_lower;
    add16 lower_adder(a[15:0],b_xor[15:0],sub,sum[15:0],cout_lower);
    add16 upper_adder(a[31:16],b_xor[31:16],cout_lower,sum[31:16], );
endmodule
