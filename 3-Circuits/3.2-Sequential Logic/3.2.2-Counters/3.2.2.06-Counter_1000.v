module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);

    wire [3:0] q0, q1, q2;

    // Counter 0: Runs constantly at 1000 Hz
    assign c_enable[0] = 1'b1;
    bcdcount counter0 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[0]),
        .Q(q0)
    );

    // Counter 1: Enables once every 10 cycles (when q0 == 9)
    assign c_enable[1] = c_enable[0] && (q0 == 4'd9);
    bcdcount counter1 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[1]),
        .Q(q1)
    );

    // Counter 2: Enables once every 100 cycles (when q0 == 9 and q1 == 9)
    assign c_enable[2] = c_enable[1] && (q1 == 4'd9);
    bcdcount counter2 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[2]),
        .Q(q2)
    );

    // OneHertz output is high for 1 clock cycle every 1000 cycles (1 second)
    assign OneHertz = c_enable[2] && (q2 == 4'd9);

endmodule