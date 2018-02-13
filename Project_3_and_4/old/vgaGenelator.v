module vgaGenelator(
    input       Clk,
    input       vgaRes,
    input [7:0] curveData,
    input [9:0] horizontalCount,
    input [9:0] verticalCount,
	output[3:0] red,
	output[3:0] green,
	output[3:0] blue
);

    // register of color 
    reg[3:0] red;
	reg[3:0] green;
	reg[3:0] blue;

    // array of double dimensional
    reg [7:0] dotPosition [0:639];    // dotPosition[8][640] (Wrote like C lang.)
    
    always @(negedge Clk or negedge vgaRes) begin
        
        // initialize
        if (!vgaRes)    begin
            red <= 0;
            green <= 0;
            blue <= 0;
        end
        
        else begin
            
        end // else end
        
    end // always end
    
endmodule