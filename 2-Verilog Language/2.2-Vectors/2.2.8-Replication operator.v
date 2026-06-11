module top_module (
    input [7:0] in,
    output [31:0] out 
);

    /* 
       Sign Extension Logic:
       - 'in[7]' is the most significant bit (MSB), which acts as the sign bit.
       - {24{in[7]}} replicates that single bit 24 times, creating a 24-bit vector.
       - The outer braces concatenate those 24 bits with the original 8 bits of 'in'.
       - Total width: 24 + 8 = 32 bits.
    */
    assign out = { {24{in[7]}}, in };

endmodule