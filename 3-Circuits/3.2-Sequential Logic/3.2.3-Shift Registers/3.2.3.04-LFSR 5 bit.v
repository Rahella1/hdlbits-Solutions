module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output reg [4:0] q
); 

    always @(posedge clk) begin
        if (reset) begin
            q <= 5'h1;
        end else begin
            // Next states according to the Galois LFSR structure with taps at bit positions 5 and 3:
            // bit 0 (q[0]) receives q[1]
            // bit 1 (q[1]) receives q[2]
            // bit 2 (q[2]) receives q[3] ^ q[0] (tap at position 3)
            // bit 3 (q[3]) receives q[4]
            // bit 4 (q[4]) receives 0 ^ q[0] = q[0] (tap at position 5)
            q[0] <= q[1];
            q[1] <= q[2];
            q[2] <= q[3] ^ q[0];
            q[3] <= q[4];
            q[4] <= q[0];
        end
    end

endmodule