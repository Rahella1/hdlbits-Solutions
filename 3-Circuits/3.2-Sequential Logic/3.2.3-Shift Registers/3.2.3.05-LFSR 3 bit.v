// Submodule representing a Multiplexer + D Flip-Flop stage
module MUXDFF (
    input clk,
    input w,        // Shift/feedback input
    input R,        // Load input
    input L,        // Load control signal
    output reg Q
);
    always @(posedge clk) begin
        Q <= L ? R : w;
    end
endmodule

// Top-level module for the DE1-SoC board implementation
module top_module (
    input [2:0] SW,      // SW[2:0] = R inputs
    input [1:0] KEY,     // KEY[0] = clk, KEY[1] = L
    output [2:0] LEDR    // LEDR[2:0] = Q outputs
);

    wire clk = KEY[0];
    wire L   = KEY[1];
    wire [2:0] R = SW;
    wire [2:0] Q;

    assign LEDR = Q;

    // Instantiate 3 stages using positional connections: MUXDFF(clk, w, R, L, Q)
    MUXDFF stage0 (clk, Q[2],        R[0], L, Q[0]);
    MUXDFF stage1 (clk, Q[0],        R[1], L, Q[1]);
    MUXDFF stage2 (clk, Q[1] ^ Q[2], R[2], L, Q[2]);

endmodule