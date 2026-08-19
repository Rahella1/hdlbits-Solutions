module top_module (
    input x,
    input y,
    output z
);

    wire out_ia1, out_ib1;
    wire out_ia2, out_ib2;
    wire or_out, and_out;

    // Submodule Instantiations
    A IA1 (x, y, out_ia1);
    B IB1 (x, y, out_ib1);
    A IA2 (x, y, out_ia2);
    B IB2 (x, y, out_ib2);

    // Combinational Gate Logic
    assign or_out  = out_ia1 | out_ib1;
    assign and_out = out_ia2 & out_ib2;
    assign z       = or_out ^ and_out;

endmodule

// Module A: x AND NOT y (from the first exercise)
module A (
    input x,
    input y,
    output z
);
    assign z = x & ~y;
endmodule

// Module B: XNOR logic (from the waveform exercise)
module B (
    input x,
    input y,
    output z
);
    assign z = ~(x ^ y);
endmodule