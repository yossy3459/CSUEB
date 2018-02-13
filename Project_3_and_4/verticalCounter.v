module verticalCounter(
    input       Clk,
    input       vgaRst,
    input       horizontalClock,
    output[9:0] verticalCount,
    output      out,
    output      vColorClock,
    output[9:0] vColorCount,
    output      verticalLineNum
);

    // declation
    reg       out;
    reg[9:0]  verticalCount;
    reg       vColorClock;
    reg[8:0]  verticalLineNum;
    reg[9:0]  vColorCount;

    always @(negedge horizontalClock or negedge vgaRst) begin
        if (!vgaRst)    begin
            out <= 1;
            verticalCount <= 0;
            vColorClock <= 1;
            verticalLineNum <= 0;
            vColorCount <= 0;
        end
        else begin
            verticalCount <= verticalCount + 1; 
            if ( verticalCount == 480 ) begin
                vColorClock <= 0;
            end
            if ( verticalCount == 490 ) begin
                out <= 0;
            end
            if ( verticalCount == 492 ) begin
                out <= 1;
                vColorCount <= vColorCount + 1;
            end
            if ( verticalCount == 521 ) begin
                verticalCount <= 0;
                vColorClock <= 1;
                verticalLineNum <= verticalLineNum + 1;
            end
        end
    end

endmodule