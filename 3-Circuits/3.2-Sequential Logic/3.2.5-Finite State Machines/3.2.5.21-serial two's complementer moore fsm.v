module top_module (
    input clk,
    input areset,
    input x,
    output z
);

    // State parameter definitions
    parameter S0 = 2'b00; // State: No '1' has been encountered yet
    parameter S1 = 2'b01; // State: First '1' has been encountered
    parameter S2 = 2'b10; // State: Subsequent bits after the first '1'

    reg [1:0] state, next_state;

    // 1. State Transition Logic (Combinational)
    always @(*) begin
        case (state)
            S0: next_state = x ? S1 : S0;
            S1: next_state = x ? S2 : S1;
            S2: next_state = x ? S2 : S1;
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

    // 3. Moore Output Logic (Output depends strictly on the current state)
    assign z = (state == S1);

endmodule