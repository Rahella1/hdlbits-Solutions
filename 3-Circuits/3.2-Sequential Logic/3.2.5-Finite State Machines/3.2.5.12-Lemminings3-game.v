module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output reg walk_left,
    output reg walk_right,
    output reg aaah,
    output reg digging ); 

    // State encoding for 6 states
    parameter LEFT      = 3'd0,
              RIGHT     = 3'd1,
              FALL_LEFT = 3'd2,
              FALL_RIGHT= 3'd3,
              DIG_LEFT  = 3'd4,
              DIG_RIGHT = 3'd5;

    reg [2:0] state, next_state;

    // State transition logic with specified precedence:
    // Fall > Dig > Switch direction (Bump)
    always @(*) begin
        case (state)
            LEFT: begin
                if (!ground)
                    next_state = FALL_LEFT;
                else if (dig)
                    next_state = DIG_LEFT;
                else if (bump_left)
                    next_state = RIGHT;
                else
                    next_state = LEFT;
            end
            RIGHT: begin
                if (!ground)
                    next_state = FALL_RIGHT;
                else if (dig)
                    next_state = DIG_RIGHT;
                else if (bump_right)
                    next_state = LEFT;
                else
                    next_state = RIGHT;
            end
            FALL_LEFT: begin
                if (ground)
                    next_state = LEFT;
                else
                    next_state = FALL_LEFT;
            end
            FALL_RIGHT: begin
                if (ground)
                    next_state = RIGHT;
                else
                    next_state = FALL_RIGHT;
            end
            DIG_LEFT: begin
                if (!ground)
                    next_state = FALL_LEFT;
                else
                    next_state = DIG_LEFT; // Bumps and dig commands ignored while digging
            end
            DIG_RIGHT: begin
                if (!ground)
                    next_state = FALL_RIGHT;
                else
                    next_state = DIG_RIGHT;
            end
            default: next_state = LEFT;
        endcase
    end

    // State flip-flops with asynchronous reset
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= LEFT; // Freshly brainwashed Lemmings walk left
        else
            state <= next_state;
    end

    // Output logic (Moore outputs)
    always @(*) begin
        walk_left  = (state == LEFT);
        walk_right = (state == RIGHT);
        aaah       = (state == FALL_LEFT) || (state == FALL_RIGHT);
        digging    = (state == DIG_LEFT)  || (state == DIG_RIGHT);
    end

endmodule