// synthesis verilog_input_version verilog_2001
module top_module (
    input  [7:0] in,
    output reg [2:0] pos
);

    always @(*) begin
        casez (in)
            8'bzzzzzzz1: pos = 3'd0; // Bit 0 is high
            8'bzzzzzz10: pos = 3'd1; // Bit 1 is high
            8'bzzzzz100: pos = 3'd2; // Bit 2 is high
            8'bzzzz1000: pos = 3'd3; // Bit 3 is high
            8'bzzz10000: pos = 3'd4; // Bit 4 is high
            8'bzz100000: pos = 3'd5; // Bit 5 is high
            8'bz1000000: pos = 3'd6; // Bit 6 is high
            8'b10000000: pos = 3'd7; // Bit 7 is high
            default:     pos = 3'd0; // Default when in == 8'b00000000
        endcase
    end

endmodule