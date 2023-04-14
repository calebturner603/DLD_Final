module registar (reset, clk, D, Q);

input logic reset;
input logic clk;
input logic [63:0] D;
output logic [63:0] Q;
reg [63:0] Q;

always @(posedge clk)
    if (reset)
        Q = 0;
    else
        Q = D;

endmodule