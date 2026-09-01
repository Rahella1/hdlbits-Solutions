module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);

    reg [7:0] in_last;

    always @(posedge clk) begin
        in_last <= in;                // Store current input for comparison in next cycle
        pedge <= in & ~in_last;       // Detect 0 to 1 transition
    end

endmodule