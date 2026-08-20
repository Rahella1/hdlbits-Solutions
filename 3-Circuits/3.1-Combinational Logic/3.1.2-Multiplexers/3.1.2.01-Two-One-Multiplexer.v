module top_module( 
    input a, b, sel,
    output out ); 
   /* 
    always@(*)begin
        if(sel==1'b1)
             out=b;
        else 
             out =a;
    end 
    */
    assign out= sel ? b:a;
endmodule