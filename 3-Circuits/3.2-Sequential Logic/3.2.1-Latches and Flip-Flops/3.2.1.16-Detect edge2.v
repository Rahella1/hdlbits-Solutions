module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);

    reg [7:0] d_in; // Stores the input value from the previous clock cycle

    always @(posedge clk) begin
        d_in <= in;                // Register the current input
        anyedge <= in ^ d_in;      // Output 1 where the bit changed state
    end

endmodule