module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);

    // BCD increment helper / 12-hour clock implementation
    always @(posedge clk) begin
        if (reset) begin
            // Reset state: 12:00:00 AM
            pm <= 1'b0;
            hh <= 8'h12;
            mm <= 8'h00;
            ss <= 8'h00;
        end else if (ena) begin
            // Seconds Counter (00 - 59 BCD)
            if (ss[3:0] == 4'h9) begin
                ss[3:0] <= 4'h0;
                if (ss[7:4] == 4'h5) begin
                    ss[7:4] <= 4'h0;
                    
                    // Minutes Counter (00 - 59 BCD)
                    if (mm[3:0] == 4'h9) begin
                        mm[3:0] <= 4'h0;
                        if (mm[7:4] == 4'h5) begin
                            mm[7:4] <= 4'h0;
                            
                            // Hours Counter (01 - 12 BCD) & AM/PM Logic
                            if (hh == 8'h11) begin
                                hh <= 8'h12;
                                pm <= ~pm; // Toggle AM/PM when advancing to 12
                            end else if (hh == 8'h12) begin
                                hh <= 8'h01; // Rollover from 12 to 01
                            end else if (hh[3:0] == 4'h9) begin
                                hh[3:0] <= 4'h0;
                                hh[7:4] <= hh[7:4] + 1'b1;
                            end else begin
                                hh[3:0] <= hh[3:0] + 1'b1;
                            end
                            
                        end else begin
                            mm[7:4] <= mm[7:4] + 1'b1;
                        end
                    end else begin
                        mm[3:0] <= mm[3:0] + 1'b1;
                    end
                    
                end else begin
                    ss[7:4] <= ss[7:4] + 1'b1;
                end
            end else begin
                ss[3:0] <= ss[3:0] + 1'b1;
            end
        end
    end

endmodule