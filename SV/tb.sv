`timescale 1ns / 1ps
module testbench();

    logic clk;
    logic reset;
    logic [63:0] seed;
    logic power;
    logic [63:0] HDMI;

    main main (clk, reset, seed, power, HDMI);


   initial 
     begin	
	 clk = 1'b1;
	 forever #10 clk = ~clk;
    end

    integer out_file;
    integer i;
    initial
        begin
            out_file = $fopen("grid.out");
            $fdisplay(out_file, "Seed = %h", seed);
            #3000 $finish;
        end

    always@(HDMI)
        begin
            $fdisplay(out_file, "******** Grid ********\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n**********************\n",
            HDMI[63:56],
            HDMI[55:48],
            HDMI[47:40],
            HDMI[39:32],
            HDMI[31:24],
            HDMI[23:16],
            HDMI[15:8],
            HDMI[7:0]);
        end






    initial
    begin
        #0 reset = 1'b1;
        #0 power = 1'b0;
        #40 seed [35:0]= 36'b0;
        #0  seed [39:36]= 4'b1111;
        #0  seed [63:40]= 24'b0;
        #50 reset = 1'b0;
        #0 power = 1'b1;
    end



endmodule