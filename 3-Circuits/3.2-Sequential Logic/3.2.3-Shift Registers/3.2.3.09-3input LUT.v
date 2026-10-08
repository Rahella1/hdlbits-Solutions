module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z );

    reg [7:0] Q;

    // Shift register: S enters at Q[0], existing bits move up
    always @(posedge clk) begin
        if (enable)
            Q <= {Q[6:0], S};
    end

    // 8-to-1 multiplexer indexed by ABC
    assign Z = Q[{A, B, C}];

endmodule