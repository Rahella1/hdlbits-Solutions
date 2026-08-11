// synthesis verilog_input_version verilog_2001
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff
);

    // 1. Continuous assignment (XOR)
    assign out_assign = a ^ b;

    // 2. Combinational always block (XOR with blocking assignment)
    always @(*) begin
        out_always_comb = a ^ b;
    end

    // 3. Clocked always block / Flip-flop (XOR with non-blocking assignment)
    always @(posedge clk) begin
        out_always_ff <= a ^ b;
    end

endmodule