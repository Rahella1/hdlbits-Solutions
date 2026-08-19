module top_module (
    input ring,
    input vibrate_mode,
    output ringer,
    output motor
);

    // Ringer activates only when ringing AND vibrate mode is OFF
    assign ringer = ring & ~vibrate_mode;

    // Motor activates only when ringing AND vibrate mode is ON
    assign motor  = ring & vibrate_mode;

endmodule