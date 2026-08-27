module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//

    //non-blocking assignment
    always @(posedge clk)begin
        q <=d;
    end
endmodule