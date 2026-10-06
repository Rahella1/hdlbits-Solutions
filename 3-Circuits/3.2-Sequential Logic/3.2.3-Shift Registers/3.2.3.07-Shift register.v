module top_module (
    input clk,
    input resetn,   // Active-low synchronous reset
    input in,
    output out
);

    reg [3:0] q;

    always @(posedge clk) begin
        if (!resetn) begin
            q <= 4'b0000;   // Clear all flip-flops on active-low reset
        end else begin
            q <= {q[2:0], in}; // Shift left: input enters LSB, shifts toward MSB
        end
    end

    assign out = q[3]; // Output comes from the last flip-flop stage

endmodule