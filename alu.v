module alu(
    input clk,
    input [7:0] a,
    input [7:0] b,
    input [3:0] student_id,
    input [15:0] op_code,
    output neg,
    output [4:0] result_1,
    output [4:0] result_2,
    output reg carry);

    reg [7:0] result;

    always @(posedge clk)
        case(op_code)
            16'b0000000000000001: begin  // sum(a,b)
                result <= a + b;
                carry <= result[8];
            end
            16'b0000000000000010: begin  // difference(a,b)
                result <= a - b;
                if (a >= b) 
                    neg <= 0;
                else
                    neg <= 1;
            end
            16'b0000000000000100: begin  // NOT(a)
                result <= ~a;
            end
            16'b0000000000001000: begin  // NAND(a,b)
                result <= ~(a & b);
            end
            16'b0000000000010000: begin  // NOR(a,b)
                result <= ~(a | b);
            end
            16'b0000000000100000: begin  // AND(a,b)
                result <= a & b;
            end
            16'b0000000001000000: begin  // XOR(a,b)
                result <= a ^ b;
            end
            16'b0000000010000000: begin  // OR(a,b)
                result <= a | b;
            end
            16'b0000000100000000: begin  // XNOR(a,b)
                result <= ~(a ^ b);
            end
            default: begin
                result <= 0;
                neg <= 0;
                carry <= 0;
            end
        endcase

    // Split result in two parts to display on each 7-segment display
    assign result_1 = result[3:0];
    assign result_2 = result[7:4];

endmodule