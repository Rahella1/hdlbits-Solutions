module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);

    // 1. Declare 8-bit internal vector wires to connect the stages
    wire [7:0] q1; // Output after 1 clock cycle delay
    wire [7:0] q2; // Output after 2 clock cycles delay
    wire [7:0] q3; // Output after 3 clock cycles delay

    // 2. Instantiate the three 8-bit D Flip-Flop stages
    my_dff8 dff1 ( .clk(clk), .d(d),  .q(q1) );
    my_dff8 dff2 ( .clk(clk), .d(q1), .q(q2) );
    my_dff8 dff3 ( .clk(clk), .d(q2), .q(q3) );

    // 3. Implement the 4-to-1 Multiplexer using a case statement
    always @(*) begin
        case (sel)
            2'b00: q = d;   // 0 cycles delay (direct input)
            2'b01: q = q1;  // 1 cycle delay
            2'b10: q = q2;  // 2 cycles delay
            2'b11: q = q3;  // 3 cycles delay
            default: q = 8'bx; // Fallback default case
        endcase
    end

endmodule