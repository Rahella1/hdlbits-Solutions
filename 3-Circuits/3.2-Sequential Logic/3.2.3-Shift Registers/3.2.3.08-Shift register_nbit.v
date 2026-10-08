module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
);

    // Instantiating 4 stages from MSB (LEDR[3]) to LSB (LEDR[0])
    // MUXDFF positional ports: (clk, w, R, E, L, Q)
    MUXDFF stage3 (KEY[0], KEY[3],   SW[3], KEY[1], KEY[2], LEDR[3]);
    MUXDFF stage2 (KEY[0], LEDR[3], SW[2], KEY[1], KEY[2], LEDR[2]);
    MUXDFF stage1 (KEY[0], LEDR[2], SW[1], KEY[1], KEY[2], LEDR[1]);
    MUXDFF stage0 (KEY[0], LEDR[1], SW[0], KEY[1], KEY[2], LEDR[0]);

endmodule


module MUXDFF (
    input clk,
    input w,
    input R,
    input E,
    input L,
    output reg Q
);

    wire d_in;

    // First MUX selects between shifting (w) and retaining current value (Q) based on Enable (E)
    // Second MUX selects between shift/hold path and parallel load (R) based on Load (L)
    assign d_in = L ? R : (E ? w : Q);

    always @(posedge clk) begin
        Q <= d_in;
    end

endmodule