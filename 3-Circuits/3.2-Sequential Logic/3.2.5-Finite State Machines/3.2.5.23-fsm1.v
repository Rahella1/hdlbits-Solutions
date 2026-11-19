module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output reg z
);

    // State definitions
    parameter A = 1'b0;
    parameter B = 1'b1;
    
    reg state, next_state;
    reg [1:0] count_cycle; // Counts 0, 1, 2 for the 3-cycle window
    reg [1:0] count_w;     // Counts how many times w = 1 in the window

    // State transition logic
    always @(*) begin
        case (state)
            A: next_state = s ? B : A;
            B: next_state = B;
            default: next_state = A;
        endcase
    end

    // Sequential logic for state and counters
    always @(posedge clk) begin
        if (reset) begin
            state <= A;
            count_cycle <= 2'd0;
            count_w <= 2'd0;
            z <= 1'b0;
        end else begin
            state <= next_state;
            
            if (state == B) begin
                // Default z to 0 unless set for the evaluation cycle
                z <= 1'b0;
                
                if (count_cycle == 2'd2) begin
                    // End of 3-cycle window: evaluate if exactly two 1s occurred
                    if ((count_w + (w ? 2'd1 : 2'd0)) == 2'd2)
                        z <= 1'b1;
                    
                    count_cycle <= 2'd0;
                    count_w <= 2'd0;
                end else begin
                    count_cycle <= count_cycle + 2'd1;
                    if (w)
                        count_w <= count_w + 2'd1;
                end
            end else begin
                count_cycle <= 2'd0;
                count_w <= 2'd0;
                z <= 1'b0;
            end
        end
    end

endmodule