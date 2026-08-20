module top_module (
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different
);

    // Both this bit and its left neighbor (higher index) are 1
    assign out_both = in[98:0] & in[99:1];

    // Either this bit or its right neighbor (lower index) is 1
    assign out_any = in[99:1] | in[98:0];

    // This bit is different from its left neighbor (with wrap-around)
    assign out_different = in ^ {in[0], in[99:1]};

endmodule