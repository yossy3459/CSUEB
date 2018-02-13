`timescale 1ns / 1ps

module timingManager(
    input Clk,
    input Rst,
    input [2:0] Fr,
    output CS,
    output WR,
    output AB,
    output PD,
    output LDAC,
    output CLR,
    output dbClock
    );
    
    // declation (internal)
    reg [2:0] clockCount;
   //  reg [7:0] shapeCount;
    reg [12:0] frequencyCount;
    reg dbClock;
    
    // declation (output)
    reg CS;
    reg WR;
    reg AB;
    wire PD;
    reg LDAC;
    reg CLR;
    
    assign PD = 1;
    
    // for Freqency
    //wire [20:0] K;
    //assign K = 2**12;  
    wire [12:0] delayValue;
    assign delayValue  = ((2**5) * (2**Fr));
    
    // main process
        always @(posedge Clk or negedge Rst) begin
        
            // Reset => initialize of internal counter
            if (!Rst) begin
                clockCount <= 0;
                // shapeCount <= 0;
                frequencyCount <= 0;
                dbClock <= 1;
                LDAC <= 0;
                AB <= 0;
                CS <= 0;
                CLR <= 1;
            end
            
            // main loop
            else begin
            
                // increment
                frequencyCount <= frequencyCount + 1;
                
                if ( frequencyCount == delayValue ) begin
                    // shapeCount <= shapeCount + 1;
                    clockCount <= clockCount + 1;
                    frequencyCount <= 0;
                    // frequencyClock <= ~frequencyClock;
                end
                
                // initialize of output
                if ( clockCount == 0 ) begin

                    WR <= 0;
                end
                
                // If clockCount equals 1, shape module writes DB. 
                if ( clockCount == 1 ) begin
                    dbClock <= 0;
                end
                    
                if ( clockCount == 2 ) begin
                    WR <= 1; // disable
                end
                
                if ( clockCount == 3 ) begin
                    dbClock <= 1;
                end
                
            end
        end
endmodule
