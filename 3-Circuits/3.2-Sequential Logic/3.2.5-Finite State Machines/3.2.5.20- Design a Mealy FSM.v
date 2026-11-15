module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output reg z ); 

    // State encoding for 3 states
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;

    reg [1:0] state, next_state;

    // Sequential logic for state transitions with asynchronous active-low reset
    always @(posedge clk or negedge aresetn) begin
        if (!aresetn)
            state <= S0;
        else
            state <= next_state;
    end

    // Combinational logic for next state and Mealy output
    always @(*) begin
        next_state = state;
        z = 1'b0;

        case (state)
            S0: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S0;
            end
            S1: begin
                if (x)
                    next_state = S1;    // Retain '1' for potential overlapping sequence
                else
                    next_state = S2;
            end
            S2: begin
                if (x) begin
                    next_state = S1;    // "101" detected; last '1' acts as start of next sequence
                    z = 1'b1;           // Mealy output asserted immediately
                end else begin
                    next_state = S0;
                end
            end
            default: begin
                next_state = S0;
                z = 1'b0;
            end
        endcase
    end

endmodule