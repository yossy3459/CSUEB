`timescale 1ns / 1ps

module adcTimingManager(
    input Clk,
    input adcRst,
    input [2:0] adcFr,
    input [7:0] D,
    output CS,
    output RD,
    //output BUSY,
    output CONVST,
    output [7:0] curveData
    );
    
    // declation (internal)
    reg [3:0] clockCount;
    // reg [7:0] shapeCount;
    reg [17:0] frequencyCount;
    reg dbClock;
    reg [7:0] curveData;
    
    // declation (output)
    reg CS;
    reg RD;
    //reg BUSY;
    reg CONVST;
    
    // for Freqency
    //wire [20:0] K;
    //assign K = 2**12;  
    wire [17:0] samplingRate;
    assign samplingRate  = 200000 / (2**adcFr);
    
    // main process
        always @(posedge Clk or negedge adcRst) begin
        
            // Reset => initialize of internal counter
            if (!adcRst) begin
                clockCount <= 0;
                // shapeCount <= 0;
                frequencyCount <= 0;
                dbClock <= 1;
                CS <= 0;
                CONVST <= 0;
                // BUSY <= 0;
                RD <= 1;
                // DB is out.
            end
            
            // main loop
            else begin
            
                // increment
                frequencyCount <= frequencyCount + 1;
                
                if ( frequencyCount == samplingRate ) begin
                    // shapeCount <= shapeCount + 1;
                    clockCount <= clockCount + 1;
                    frequencyCount <= 0;
                    // frequencyClock <= ~frequencyClock;
                end
                
                // initialize of output
                if ( clockCount == 0 ) begin
                    CONVST <= 0;
                end
                
                // If clockCount equals 1, shape module writes DB. 
                if ( clockCount == 1 ) begin
                   //  BUSY <= 1;
                end
                    
                if ( clockCount == 2 ) begin
                    CONVST <= 1; 
                end
                
                if ( clockCount == 6 ) begin
                    CONVST <= 0;
                    RD <= 0;
                end
                
                if ( clockCount == 7 ) begin
                    curveData <= D;
                end
                
                if ( clockCount == 8 ) begin
                    CONVST <= 1;
                    RD <= 1;
                end
                
                if ( clockCount == 12 ) begin
                    clockCount <= 0;
                end
                
            end
        end
endmodule
