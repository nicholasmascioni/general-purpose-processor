module fsm(
    input clk,
    input data_in,
    input reset,
    output reg [3:0] student_id,
    output reg [3:0] current_state);

    // States
    localparam S0 = 4'd0;
    localparam S1 = 4'd1;
    localparam S2 = 4'd2;
    localparam S3 = 4'd3;
    localparam S4 = 4'd4;
    localparam S5 = 4'd5;
    localparam S6 = 4'd6;
    localparam S7 = 4'd7;
    localparam S8 = 4'd8;

    // Store current state
    reg [3:0] state;

    // Digits
    localparam D1 = 4'd5;
    localparam D2 = 4'd0;
    localparam D3 = 4'd1;
    localparam D4 = 4'd2;
    localparam D5 = 4'd3;
    localparam D6 = 4'd4;
    localparam D7 = 4'd8;
    localparam D8 = 4'd6;
    localparam D9 = 4'd7;
    
    // Change state depending on present state and input on the rising edge of the clock
    always @(posedge clk, posedge reset)
        if (reset)
            state <= S0;
        else
            case(state) 
                S0: state <= data_in ? S1 : S0;
                S1: state <= data_in ? S2 : S1;
                S2: state <= data_in ? S3 : S2;
                S3: state <= data_in ? S4 : S3;
                S4: state <= data_in ? S5 : S4;
                S5: state <= data_in ? S6 : S5;
                S6: state <= data_in ? S7 : S6;
                S7: state <= data_in ? S8 : S7;
                S8: state <= data_in ? S0 : S8;
                default: state <= SO;
            endcase

    // Output different student ID digit depending on current state and input
    always @(*)
        case(state)
            S0: current_state <= 4'd0; student_id <= data_in ? D2 : D1;
            S1: current_state <= 4'd1; student_id <= data_in ? D3 : D2;
            S2: current_state <= 4'd2; student_id <= data_in ? D4 : D3;
            S3: current_state <= 4'd3; student_id <= data_in ? D5 : D4;
            S4: current_state <= 4'd4; student_id <= data_in ? D6 : D5;
            S5: current_state <= 4'd5; student_id <= data_in ? D7 : D6;
            S6: current_state <= 4'd6; student_id <= data_in ? D8 : D7;
            S7: current_state <= 4'd7; student_id <= data_in ? D9 : D8;
            S8: current_state <= 4'd8; student_id <= data_in ? D1 : D9;
        endcase

endmodule