module horizontalCounter(
    input       Clk,
    input       vgaRst,
    output [9:0] horizontalCount,
	output      out,
	output      hColorClock,
	output [9:0] hColorCount,
	output      vgaClock
);

    reg       out;
	reg[2:0]  horizontalClock;
    reg[9:0]  horizontalCount;
    reg  hColorClock;
    reg[9:0]  hColorCount; 
    reg vgaClock;

	always @(negedge Clk or negedge vgaRst) begin
		if (!vgaRst)	begin
			out <= 1;
			horizontalClock <= 0;
			horizontalCount <= 0;
			hColorClock <= 1;
			hColorCount <= 0;
			vgaClock <= 0;
		end
		else begin
			horizontalClock <= horizontalClock + 1;
			
			//
	       if ( horizontalClock == 1 ) begin
	           vgaClock <= ~vgaClock;
	       end
		  if ( horizontalClock == 3 ) begin
			 horizontalClock <= 0;
			 vgaClock <= ~vgaClock;
			 
			 horizontalCount <= horizontalCount + 1;
		  end
		   // 
		  
		  if ( horizontalCount == 640 ) begin
		      hColorClock <= 0;
		  end
		  if ( horizontalCount == 656 ) begin
		     out <= 0;
		     // hColorCount <= hColorCount + 1;
		  end
		  if ( horizontalCount == 752 ) begin
		     out <= 1;
		  end
		  if ( horizontalCount == 800 ) begin
		     horizontalCount <= 0;
		     hColorClock <= 1;
		      /*if ( hColorCount > 640 ) begin
		          hColorCount <= 0;
		      end*/
		  end
		end
	end

endmodule
