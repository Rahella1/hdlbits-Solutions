module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z 
);

    /*
       The left side glues the four 8-bit outputs into a single 32-bit destination.
       The right side glues the six 5-bit inputs plus two 1-bit constants (2'b11) 
       to form a 32-bit source stream.
    */
    assign {w, x, y, z} = {a, b, c, d, e, f, 2'b11};

endmodule