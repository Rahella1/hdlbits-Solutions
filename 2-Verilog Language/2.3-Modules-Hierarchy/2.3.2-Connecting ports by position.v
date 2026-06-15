module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    /* 
       Instantiating mod_a using positional connections:
       We pass the signals in the exact order the sub-module expects them)
    */
   mod_a instance_name ( out1, out2, a, b, c, d );
endmodule