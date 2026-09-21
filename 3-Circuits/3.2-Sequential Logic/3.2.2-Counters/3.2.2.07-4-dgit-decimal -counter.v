// Single-digit decade (BCD) counter helper module
module bcd_digit (
    input wire clk,
    input wire reset,
    input wire ena,
    output reg [3:0] q,
    output wire carry
);
    always @(posedge clk) begin
        if (reset) begin
            q <= 4'd0;
        end else if (ena) begin
            if (q == 4'd9) begin
                q <= 4'd0;
            end else begin
                q <= q + 1'b1;
            end
        end
    end

    // Carry out when digit is 9 and enabled
    assign carry = (q == 4'd9) && ena;

endmodule


// Top-level 4-digit BCD counter using positional port connection
module top_module (
    input wire clk,
    input wire reset,
    output wire [3:1] ena,
    output wire [15:0] q
);

    wire dummy_carry;

    // Positional order: (clk, reset, ena, q, carry)

    // Ones Digit
    bcd_digit digit0 (clk, reset, 1'b1,   q[3:0],   ena[1]);

    // Tens Digit
    bcd_digit digit1 (clk, reset, ena[1], q[7:4],   ena[2]);

    // Hundreds Digit
    bcd_digit digit2 (clk, reset, ena[2], q[11:8],  ena[3]);

    // Thousands Digit
    bcd_digit digit3 (clk, reset, ena[3], q[15:12], dummy_carry);

endmodule