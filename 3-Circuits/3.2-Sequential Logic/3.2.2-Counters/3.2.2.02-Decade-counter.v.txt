module decade_counter (
    input  wire       clk,
    input  wire       reset, // Active-high synchronous reset
    output reg  [3:0] q
);

    always @(posedge clk) begin
        if (reset) begin
            q <= 4'b0000;
        end else if (q == 4'd9) begin
            q <= 4'b0000;
        end else begin
            q <= q + 1'b1;
        end
    end

endmodule