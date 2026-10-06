module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output reg [31:0] q
); 

    always @(posedge clk) begin
        if (reset) begin
            q <= 32'h1;
        end else begin
            // Shift right and XOR selective tap locations if q[0] is 1
            // Tap mask corresponds to bits 32, 22, 2, 1 -> 32'h80200003
            q <= {q[0], q[31:1]} ^ (q[0] ? 32'h00200003 : 32'h0);
        end
    end

endmodule