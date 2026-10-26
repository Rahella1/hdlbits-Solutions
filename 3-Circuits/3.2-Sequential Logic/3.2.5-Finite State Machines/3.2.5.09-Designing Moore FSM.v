module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output reg dfr
); 

    // State encoding: 
    // Using 6 states to track water level and whether water level was rising/falling/stable.
    // Let's define them based on standard solutions:
    // Below S1 (state A / lowest) -> equivalent to low for a long time (all sensors 0, all outputs 1)
    parameter A2 = 3'd0, // Below S1, coming from below or long time low (fr = 111, dfr = 1)
              B1 = 3'd1, // Between S1 and S2, coming from below
              B2 = 3'd2, // Between S1 and S2, coming from above
              C1 = 3'd3, // Between S2 and S3, coming from below
              C2 = 3'd4, // Between S2 and S3, coming from above
              D1 = 3'd5; // Above S3 (fr = 000)

    reg [2:0] state, next_state;

    // State transition logic
    always @(*) begin
        case (state)
            A2: next_state = s[1] ? B1 : A2;
            B1: next_state = s[2] ? C1 : (s[1] ? B1 : A2);
            B2: next_state = s[2] ? C1 : (s[1] ? B2 : A2);
            C1: next_state = s[3] ? D1 : (s[2] ? C1 : B2);
            C2: next_state = s[3] ? D1 : (s[2] ? C2 : B2);
            D1: next_state = s[3] ? D1 : C2;
            default: next_state = A2;
        endcase
    end

    // State flip-flops with synchronous active-high reset
    always @(posedge clk) begin
        if (reset)
            state <= A2;
        else
            state <= next_state;
    end

    // Output logic (Moore outputs: fr3, fr2, fr1, dfr)
    always @(*) begin
        case (state)
            A2: {fr3, fr2, fr1, dfr} = 4'b1111;
            B1: {fr3, fr2, fr1, dfr} = 4'b0110;
            B2: {fr3, fr2, fr1, dfr} = 4'b0111;
            C1: {fr3, fr2, fr1, dfr} = 4'b0010;
            C2: {fr3, fr2, fr1, dfr} = 4'b0011;
            D1: {fr3, fr2, fr1, dfr} = 4'b0000;
            default: {fr3, fr2, fr1, dfr} = 4'b1111;
        endcase
    end

endmodule