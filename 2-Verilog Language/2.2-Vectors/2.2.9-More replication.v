module top_module (
    input a, b, c, d, e,
    output [24:0] out 
);

    // Top vector: 5 copies of 'a', then 5 of 'b', 5 of 'c', 5 of 'd', 5 of 'e'
    // Bottom vector: The pattern {a,b,c,d,e} repeated 5 times total
    wire [24:0] top, bottom;
	assign top    = { {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} };
	assign bottom = {5{a,b,c,d,e}};
	assign out = ~top ^ bottom;	// Bitwise XNOR
    //assign out = ~{ {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} } ^ {5{a, b, c, d, e}};

endmodule