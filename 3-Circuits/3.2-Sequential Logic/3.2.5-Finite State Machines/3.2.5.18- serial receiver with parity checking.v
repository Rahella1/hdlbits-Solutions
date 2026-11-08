module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output reg done
);

    // State encoding
    parameter IDLE      = 4'd0;
    parameter S0        = 4'd1;
    parameter S1        = 4'd2;
    parameter S2        = 4'd3;
    parameter S3        = 4'd4;
    parameter S4        = 4'd5;
    parameter S5        = 4'd6;
    parameter S6        = 4'd7;
    parameter S7        = 4'd8;
    parameter PARITY    = 4'd9;
    parameter STOP      = 4'd10;
    parameter WAIT_HIGH = 4'd11;

    reg [3:0] state, next_state;
    reg [7:0] shift_reg;
    wire odd;

    // Instantiate the provided parity module
    parity p_inst (
        .clk(clk),
        .reset(reset || (state == IDLE)),
        .in(in),
        .odd(odd)
    );

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // State transition logic (combinational)
    always @(*) begin
        case (state)
            IDLE:      next_state = in ? IDLE : S0;
            S0:        next_state = S1;
            S1:        next_state = S2;
            S2:        next_state = S3;
            S3:        next_state = S4;
            S4:        next_state = S5;
            S5:        next_state = S6;
            S6:        next_state = S7;
            S7:        next_state = PARITY;
            PARITY:    next_state = STOP;
            STOP:      next_state = in ? IDLE : WAIT_HIGH;
            WAIT_HIGH: next_state = in ? IDLE : WAIT_HIGH;
            default:   next_state = IDLE;
        endcase
    end

    // Datapath & Output logic
    always @(posedge clk) begin
        if (reset) begin
            shift_reg <= 8'd0;
            out_byte  <= 8'd0;
            done      <= 1'b0;
        end else begin
            done <= 1'b0;
            
            // Shift in data bits LSB-first during S0 through S7
            if (state >= S0 && state <= S7) begin
                shift_reg <= {in, shift_reg[7:1]};
            end
            
            // Verify stop bit and odd parity in STOP state
            if (state == STOP && in) begin
                if (odd) begin
                    out_byte <= shift_reg;
                    done     <= 1'b1;
                end
            end
        end
    end

endmodule