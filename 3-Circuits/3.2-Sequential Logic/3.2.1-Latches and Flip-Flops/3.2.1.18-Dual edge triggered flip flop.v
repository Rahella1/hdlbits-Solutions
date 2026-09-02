module top_module (
    input clk,
    input d,
    output q
);
   reg p; // Stores value on posedge
    reg n; // Stores value on negedge

    // Capture d ^ n on the positive edge
    always @(posedge clk) begin
        p <= d ^ n;
    end

    // Capture d ^ p on the negative edge
    always @(negedge clk) begin
        n <= d ^ p;
    end

    // Combining p and n using XOR yields d on both edges
    assign q = p ^ n;
endmodule