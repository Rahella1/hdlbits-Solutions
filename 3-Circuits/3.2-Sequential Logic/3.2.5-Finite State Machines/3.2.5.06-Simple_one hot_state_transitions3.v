module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); 

    // State encoding mapping:
    // state[0] = A
    // state[1] = B
    // state[2] = C
    // state[3] = D

    // Next-state logic derived by inspecting incoming edges:
    assign next_state[0] = (state[0] & ~in) | (state[2] & ~in); // A <- A (in=0) or C (in=0)
    assign next_state[1] = (state[0] & in) | (state[1] & in) | (state[3] & in); // B <- A, B, or D (in=1)
    assign next_state[2] = (state[1] & ~in) | (state[3] & ~in); // C <- B or D (in=0)
    assign next_state[3] = (state[2] & in);                     // D <- C (in=1)

    // Output logic: Output is high only in state D (state[3])
    assign out = state[3];

endmodule