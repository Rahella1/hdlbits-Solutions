module top_module ( 
    input clk, 
    input d, 
    output q 
);

    // 1. Declare internal wires to connect the stages together
    wire q1; // Connects output of dff1 to input of dff2
    wire q2; // Connects output of dff2 to input of dff3

    // 2. Instantiate the first D-Flip-Flop
    my_dff dff1 (
        .clk(clk),
        .d(d),
        .q(q1)
    );

    // 3. Instantiate the second D-Flip-Flop
    my_dff dff2 (
        .clk(clk),
        .d(q1),   // Takes the output from the first flip-flop
        .q(q2)
    );

    // 4. Instantiate the third D-Flip-Flop
    my_dff dff3 (
        .clk(clk),
        .d(q2),   // Takes the output from the second flip-flop
        .q(q)     // Connects directly to the top-level output port
    );

endmodule