module register (reset, clk, D, Q, seed);

input logic reset;
input logic clk;
input logic [63:0] D;
output logic [63:0] Q;
input logic [63:0] seed;

always @(posedge clk, posedge reset)
    if (reset)
        Q <= seed;
    else
        Q <= D;

endmodule