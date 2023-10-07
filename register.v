module register(
    input clk,
    input [7:0] d,
    input reset,
    output reg [7:0] q
);

    always @(posedge clk, posedge reset)
        q <= reset ? 8'd0 : d;

endmodule