`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
     //Declare the internal wires connecting the AND gates ot OR gates
    wire w1;
    wire w2;
    //continuous assignmnets 
    assign w1 = a & b;   //first AND gate
    assign w2 = c & d;   //second AND gate

    assign out = w1 | w2; //OR gate
    assign out_n = ~out;  //NOT gate
    
endmodule