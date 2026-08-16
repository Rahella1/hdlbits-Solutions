module top_module (
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
);

    // Create a 101-bit wire vector to manage the carry chain
    // c[0]   is the initial input carry (cin)
    // c[100] is the final output carry (cout)
    wire [100:0] c;
    assign c[0] = cin;
    assign cout = c[100];

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_adder_chain
            bcd_fadd bcd_inst (
                .a(a[4*i+3 : 4*i]),      // Extracts 4-bit BCD digit i
                .b(b[4*i+3 : 4*i]),      // Extracts 4-bit BCD digit i
                .cin(c[i]),              // Carry-in from previous digit
                .cout(c[i+1]),           // Carry-out to next digit
                .sum(sum[4*i+3 : 4*i])   // Output 4-bit sum digit i
            );
        end
    endgenerate

endmodule