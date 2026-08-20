module top_module (
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different
);

    // Both this bit and its left neighbour are 1
    assign out_both = in[2:0] & in[3:1];

    // Either this bit or its right neighbour is 1
    assign out_any = in[3:1] | in[2:0];

    // This bit is different from its left neighbour (wrapping around)
    assign out_different = in ^ {in[0], in[3:1]};

endmodule