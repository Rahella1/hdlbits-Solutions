module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    integer i;
    always @(*) begin
        out =8'd0;     //1. Reset the counter to 0 first
        for(i =0; i < 255; i++)begin
            out = out + in[i]; //2.Add bit i (0 or 1) to the total
        end
    end
            
endmodule