module dec2to4( 
    input [3:0] w,
    input en,
    output reg [15:0] y); 

    always @(*) 
        case ({en, w})
            5'b10000: Y = 16'd0; 
            5'b10001: Y = 16'd1; 
            5'b10010: Y = 16'd2; 
            5'b10011: Y = 16'd3; 
            5'b10100: Y = 16'd4;
            5'b10101: Y = 16'd5;
            5'b10110: Y = 16'd6;
            5'b10111: Y = 16'd7;
            5'b11000: Y = 16'd8;
            5'b11001: Y = 16'd9;
            5'b11010: Y = 16'd10;
            5'b11011: Y = 16'd11;
            5'b11100: Y = 16'd12;
            5'b11101: Y = 16'd13;
            5'b11110: Y = 16'd14;
            5'b11111: Y = 16'd15;
            default: Y = 16'd0;
        endcase 
endmodule