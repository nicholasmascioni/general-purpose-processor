module sseg(
    input [3:0] bcd,
    input neg,
    output [6:0] result,
    output sign
);

    always @(*) begin
        sign = neg ? 1'b1 : 1'b0;

        /*
        7-segment display has LEDs A through G for each segment, arraged as follows:
            A 
            _
        F |   | B
            _ 
        E | G | C
            _
            D
        */

        case(bcd)
            4'd0: result = 7'b1111110; // 0
            4'd1: result = 7'b0110000; // 1
            4'd2: result = 7'b1101101; // 2
            4'd3: result = 7'b1111001; // 3
            4'd4: result = 7'b0110011; // 4
            4'd5: result = 7'b1011011; // 5
            4'd6: result = 7'b1011111; // 6
            4'd7: result = 7'b1110000; // 7
            4'd8: result = 7'b1111111; // 8
            4'd9: result = 7'b1110011; // 9
            4'd10: result = 7'b1110111; // A
            4'd11: result = 7'b0011111; // B
            4'd12: result = 7'b1001110; // C
            4'd13: result = 7'b0111101; // D
            4'd14: result = 7'b1001111; // E
            4'd15: result = 7'b1000111; // F
            default: result = 7'b1111110; // 0
        endcase
    end

endmodule