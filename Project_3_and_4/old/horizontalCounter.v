module horizontalCounter(
    input       Clk,
    input       vgaRes,
    output[9:0] horizontalCount,
	output      out
);

    reg       out;
	reg[2:0]  horizontalClock;
    reg[9:0]  horizontalCount;

	always @(negedge Clk or negedge vgaRes) begin
		if (!vgaRes)	begin
			out <= 1;
			horizontalClock <= 0;
			horizontalCount <= 0;
		end
		else begin
			horizontalClock <= horizontalClock + 1;
		  if ( horizontalClock == 3 ) begin
			 horizontalClock <= 0;
			 horizontalCount <= horizontalCount + 1;
		  end
		  if ( horizontalCount == 656 ) begin
		     out <= 0;
		  end
		  if ( horizontalCount == 752 ) begin
		     out <= 1;
		  end
		  if ( horizontalCount == 800 ) begin
		     horizontalCount <= 0;
		  end
		end
	end

endmodule
