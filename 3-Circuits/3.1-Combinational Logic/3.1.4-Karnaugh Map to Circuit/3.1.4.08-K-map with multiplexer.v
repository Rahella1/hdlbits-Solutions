module top_module (
    input c,
    input d,
    output [3:0] mux_in
);

    // mux_in[0] for {a,b} = 2'b00
    // mux_in[1] for {a,b} = 2'b01
    // mux_in[2] for {a,b} = 2'b10
    // mux_in[3] for {a,b} = 2'b11

    assign mux_in[0] = c | d;
    assign mux_in[1] = 1'b0;
    assign mux_in[2] = ~d;
    assign mux_in[3] = c & d;

endmodule