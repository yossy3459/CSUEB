module vgaGenelator(
    input       Clk,
    input       vgaClock,
    input       vgaRst,
    // input       Ack,
    // input       RD,
    input [7:0] curveData,
    // input [9:0] horizontalCount,
    // input [9:0] verticalCount,
    input       hColorClock,
    input       vColorClock,
    // input [8:0] verticalLineNum,
    input [9:0] adcToVgaCount,
    input [9:0] hColorCount,
    input [9:0] vColorCount,
    output[3:0] red,
	output[3:0] green,
	output[3:0] blue
);

    // register of color 
    reg[3:0] red;
	reg[3:0] green;
	reg[3:0] blue;
	
    // array of two dimensional
    reg [7:0] dotPosition [0:639];    // dotPosition[8][640] (Wrote like C lang.)
   
    // decration
    reg dataWriting;
    reg [9:0] temp;
    reg [7:0] temp1;
    reg flag;
    
    reg [12:0] vgaCount;
    
    integer i;
    
    always @( negedge Clk or negedge vgaRst ) begin
        
        // initialize
        if (!vgaRst)    begin
            red <= 0;
            green <= 0;
            blue <= 0;
            dataWriting <= 0;
            flag <= 0;
            temp <= 0;
            temp1 <= 0;
            vgaCount <= 0;
            /*for ( i=0 ; i<640 ; i = i+1 ) begin
                dotPosition[i] <= i;
            end*/
        end
        
        // main loop
        else begin
            if ( vgaCount == 0 ) begin
                 dotPosition[temp] <= 255 - curveData; 
                 temp <= temp + 1;
            end
         
                if ( dotPosition[hColorCount] + 100 == vColorCount ) begin
                    if ( hColorClock == 1 && vColorClock == 1 ) begin
                        red <= 15;
                        green <= 15;
                        blue <= 15;
                    end
                    else begin
                        red <= 0;
                        green <= 0;
                        blue <= 0;
                    end
                end
                else begin
                    if ( hColorClock == 1 && vColorClock == 1 ) begin
                        red <= 0;
                        green <= 0;
                        blue <= 0;
                    end
                end       

                
            vgaCount <= vgaCount + 1;  
            
        end // else end
        
    end // always end
    
endmodule