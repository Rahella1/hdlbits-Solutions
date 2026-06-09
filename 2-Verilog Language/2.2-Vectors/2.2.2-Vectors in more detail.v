`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
   /* 
       Assigning the High Byte:
       - Slicing from index 15 down to 8 captures exactly 8 bits.
    */
    assign out_hi = in[15:8];
    
    /* 
       Assigning the Low Byte:
       - Slicing from index 7 down to 0 captures exactly 8 bits.
    */
    assign out_lo = in[7:0];
    
endmodule