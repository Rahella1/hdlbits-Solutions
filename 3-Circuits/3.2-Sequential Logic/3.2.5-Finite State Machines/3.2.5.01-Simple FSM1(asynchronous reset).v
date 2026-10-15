module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);

    // State encoding
    parameter A = 1'b0, B = 1'b1; 
    reg state, next_state;

    // 1. Combinational Next-State Logic
    always @(*) begin
        case (state)
            A:       next_state = in ? A : B;
            B:       next_state = in ? B : A;
            default: next_state = B;
        endcase
    end

    // 2. Sequential State Register with Asynchronous Reset
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= B;
        end else begin
            state <= next_state;
        end
    end

    // 3. Output Logic (Moore Output)
    assign out = (state == B);

endmodule