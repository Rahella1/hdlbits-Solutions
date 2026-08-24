module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum 
);

    // Positional mapping matches the fadd declaration order: (a, b, cin, cout, sum)
    fadd add0 (a[0], b[0], cin, cout[0], sum[0]);
    fadd add1 (a[1], b[1], cout[0], cout[1], sum[1]);
    fadd add2 (a[2], b[2], cout[1], cout[2], sum[2]);

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum 
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule