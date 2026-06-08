module top_module ( 
    // Sub-circuit 1 Inputs (Top-right and middle-right gates)
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    
    // Sub-circuit 2 Inputs (Top-left and middle-left gates )
    input p2a, p2b, p2c, p2d,
    output p2y 
);

    /* 
       Internal Wire Declarations
         These wires hold the outputs of the individual AND gates before they are combined by the OR gates.
    */
    wire w1; // Output of the 3-input AND gate (p1a & p1b & p1c)
    wire w2; // Output of the 3-input AND gate (p1d & p1e & p1f)
    wire w3; // Output of the 2-input AND gate (p2a & p2b)
    wire w4; // Output of the 2-input AND gate (p2c & p2d)

    /* 
       Continuous Assignments for Intermediate Logic
       These represent the outputs of the four independent AND gates.
    */
    assign w1 = p1a & p1b & p1c;
    assign w2 = p1d & p1e & p1f;
    assign w3 = p2a & p2b;
    assign w4 = p2c & p2d;

    /* 
       Final Output Assignments
       The intermediate wires feed into their respective OR gates 
       to produce the final output signals.
    */
    assign p1y = w1 | w2; // Combines the two 3-input AND sub-circuits
    assign p2y = w3 | w4; // Combines the two 2-input AND sub-circuits

endmodule