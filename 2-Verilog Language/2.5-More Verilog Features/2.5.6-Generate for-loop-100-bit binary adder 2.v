//1-Bit Full Adder sub-module
module fadd(
    inout a,b, cin,
    output sum, cout
);
     assign sum = a ^ b ^ cin;
    assign cout = (a&b) + (a&cin) + (b&cin);
endmodule

//Top module: 100-Bit Ripple-carry Adder
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum 
);
  // Bit 0: Positional mapping (a[0], b[0], cin, sum[0], cout[0])
    fadd f0(a[0],b[0],cin,sum[0],cout[0]);
    genvar i;
    generate
        for(i = 1; i < 100; i = i + 1)begin : adder_chair
            //signals match fadd order: (a,b,cin,sum,cout)
            fadd f_inst (a[i], b[i], cout[i-1],sum[i], cout[i]);
        end
    endgenerate
endmodule