module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);

    reg [31:0] in_last;

    always @(posedge clk) begin
        // Store the current state of 'in' to use for edge detection in the next cycle
        in_last <= in;
        
        if (reset) begin
            // Reset has precedence over set
            out <= 32'b0;
        end else begin
            // Keep set bits high, or set new bits where a falling edge (1 -> 0) occurred
            out <= out | (in_last & ~in);
        end
    end

endmodule