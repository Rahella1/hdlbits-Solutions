module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    // Connecting by name pairs .port_name_inside_mod_a(wire_name_in_top_module)
    mod_a instance_name (
        .out1(out1),
        .out2(out2),
        .in1(a),
        .in2(b),
        .in3(c),
        .in4(d)
    );
endmodule