module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_lower, sum_upper0, sum_upper1;
    wire sel;

    // Order: (a, b, cin, sum, cout)
    add16 lower_adder  ( a[15:0],  b[15:0],  1'b0, sum_lower,  sel );
    add16 upper_adder0 ( a[31:16], b[31:16], 1'b0, sum_upper0,     );
    add16 upper_adder1 ( a[31:16], b[31:16], 1'b1, sum_upper1,     );
//if cout==0,the MUX flips its switch to select Upper Adder 0's answer
//if cout==1,the MUX flips its switch to select Lower Adder 1's answer
    assign sum = { (sel ? sum_upper1 : sum_upper0), sum_lower };

endmodule