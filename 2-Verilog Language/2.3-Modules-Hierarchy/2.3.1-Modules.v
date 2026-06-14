module top_module ( 
    input a, 
    input b, 
    output out 
);

    /* 
       Instantiating mod_a using named port connections:
       Syntax: module_name instance_name ( .submodule_port(parent_wire), ... );
    */
    mod_a instance_name (
        .in1(a),   // Connects top_module input 'a' to mod_a's input 'in1'
        .in2(b),   // Connects top_module input 'b' to mod_a's input 'in2'
        .out(out)  // Connects mod_a's output 'out' to top_module's output 'out'
    );

endmodule