module verticalCounter(
    input       Clk,
    input       vgaRes,
    input       horizontalClock,
    output[9:0] verticalCount,
    output      out
);

    reg       out;
    reg[9:0]  verticalCount;


    always @(negedge horizontalClock or negedge vgaRes) begin
        if (!vgaRes)    begin
            out <= 1;
            verticalCount <= 0;
        end
        else begin
            verticalCount <= verticalCount + 1; 
            if ( verticalCount == 490 ) begin
                out <= 0;
            end
                if ( verticalCount == 492 ) begin
                out <= 1;
            end
            if ( verticalCount == 521 ) begin
                verticalCount <= 0;
            end
        end
    end

endmodule