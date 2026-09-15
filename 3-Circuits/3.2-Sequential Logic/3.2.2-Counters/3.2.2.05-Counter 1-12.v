module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);

    // 1. Set internal enable to match external enable
    assign c_enable = enable;

    // 2. Load value is always 1 (4'b0001) for reset or rollover
    assign c_d = 4'd1;

    // 3. Load when external reset is active OR when counting is enabled and Q reaches 12
    assign c_load = reset || (enable && (Q == 4'd12));

    // 4. Instantiate count4 using POSITIONAL port association:
    // Order from definition: count4(clk, enable, load, d, Q)
    count4 count_inst (
        clk,
        c_enable,
        c_load,
        c_d,
        Q
    );

endmodule