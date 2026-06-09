module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  
); 

    /* 
       Vector Assignment:
       When assigning one entire vector to another of the same size, 
       you do not need to include the bit range [2:0]. 
       Simply use the variable names directly.
    */
    assign outv = vec;

    /* 
       Bit-Select Assignments:
       To extract an individual bit from a vector, the bracketed index 
       must always go AFTER the variable name (e.g., vec[0], not [0]vec).
    */
    assign o0 = vec[0]; // Assigns the least significant bit (bit 0) to o0
    assign o1 = vec[1]; // Assigns the middle bit (bit 1) to o1
    assign o2 = vec[2]; // Assigns the most significant bit (bit 2) to o2

endmodule
