module top_module( 
    input [31:0] in,
    output [31:0] out 
);

    assign out[31:24] = in[7:0];   // Top byte gets bottom byte
    assign out[23:16] = in[15:8];  // Mid-upper byte gets mid-lower byte
    assign out[15:8]  = in[23:16]; // Mid-lower byte gets mid-upper byte
    assign out[7:0]   = in[31:24]; // Bottom byte gets top byte

endmodule