module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);

    // 1. Bitwise OR: Computes the OR gate for each corresponding bit independently
    assign out_or_bitwise = a | b;

    // 2. Logical OR: Treats each vector as a single boolean value (0 is False, non-zero is True)
    assign out_or_logical = a || b;

    // 3. Bitwise NOT + Concatenation: Inverts the bits and joins them together
    // Places ~b in the upper bits [5:3] and ~a in the lower bits [2:0]
    assign out_not = {~b, ~a};

endmodule