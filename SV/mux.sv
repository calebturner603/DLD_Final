module mux(input logic [63:0] seed, 
            input logic [63:0] grid,
            input logic power,
            output logic [63:0] Y);



assign Y = power ? grid : seed;  

endmodule
