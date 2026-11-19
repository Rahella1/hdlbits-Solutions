module top_module (
    input clk,
    input areset,
    input x,
    output z
);

    // One-hot state encodings (2 states)
    parameter S0 = 2'b01; // State 0: No '1' has been encountered yet
    parameter S1 = 2'b10; // State 1: After the first '1' has been encountered

    reg [1:0] state, next_state;

    // 1. State Transition Logic (Combinational)
    always @(*) begin
        case (state)
            S0: next_state = x ? S1 : S0;
            S1: next_state = S1;
            default: next_state = S0;
        endcase
    end

    // 2. State Registers with Asynchronous Reset (Sequential)
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= S0;
        else
            state <= next_state;
    end

    // 3. Mealy Output Logic (Output depends on both state and input x)
    // In S0, z equals x (passes 0s and the first 1).
    // In S1, z equals ~x (inverts all subsequent bits).
    assign z = (state[0] & x) | (state[1] & ~x);

endmodule