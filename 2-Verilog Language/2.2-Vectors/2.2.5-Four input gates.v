module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);

    /* 
       Reduction Operators:
       By placing the operator BEFORE a single operand, Verilog performs 
       the operation bit-by-bit across the entire bus width.
    */
    
    assign out_and = &in;  // Equivalent to: in[3] & in[2] & in[1] & in[0]
    assign out_or  = |in;  // Equivalent to: in[3] | in[2] | in[1] | in[0]
    assign out_xor = ^in;  // Equivalent to: in[3] ^ in[2] ^ in[1] ^ in[0]

endmodule