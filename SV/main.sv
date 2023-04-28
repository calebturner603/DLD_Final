module main(input logic clk, reset, 
            input logic [63:0] seed,
            input logic power, 
            output logic [63:0] HDMI);


logic [63:0] Y;
logic [63:0] grid;
logic [63:0] grid_evolve;

mux mux1 (seed, grid, power, Y);

datapath datapath (Y, grid_evolve);

register register (reset, clk, grid_evolve, grid, seed);

mux mux2 (seed, grid, power, HDMI);


endmodule