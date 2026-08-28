module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
);

    always @(posedge clk) begin
        if (!resetn) begin
            // Active-low reset: resets all 16 bits to 0 when resetn is LOW (0)
            q <= 16'b0;
        end else begin
            // Byte 0 control: updates lower byte d[7:0] when byteena[0] is HIGH
            if (byteena[0]) begin
                q[7:0] <= d[7:0];
            end
            
            // Byte 1 control: updates upper byte d[15:8] when byteena[1] is HIGH
            if (byteena[1]) begin
                q[15:8] <= d[15:8];
            end
        end
    end

endmodule