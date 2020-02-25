// Avalon_Master_Memory.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module Avalon_Master_Memory (
		output reg [9:0]  avalon_master_address,     // avalon_master.address
		output reg        avalon_master_chipselect,  //              .chipselect
		output reg        avalon_master_read,        //              .read
		input  wire [7:0]  avalon_master_readdata,   //              .readdata
		output reg        avalon_master_write,       //              .write
		output reg [7:0]  avalon_master_writedata,   //              .writedata
		input  wire        avalon_master_waitrequest,//              .waitrequest
		input  wire        clock,                    //         clock.clk
		output wire [41:0] HEXes,                     //         world.hex_screen
		output wire [9:0]  LEDR,                      //              .ledr
		input  wire [3:0]  Keys,                     //              .key_input
		input  wire [9:0]  Switches,                 //              .switches
		input  wire        reset                     //         reset.reset
	);
	
	reg [9:0]sw1,sw2;
	reg [3:0]key1,key2;
	reg [7:0]mem_out;
	reg [5:0]counter;
	
	reg refresh;
	
	wire key0_edge,key1_edge,key2_edge,key3_edge;
	
	_edge_detector det0(key0_edge,CLOCK_50,key2[0]),det1(key1_edge,CLOCK_50,key2[1]),
						det2(key2_edge,CLOCK_50,key2[2]),det3(key3_edge,CLOCK_50,key2[3]);
						
	assign LEDR[9] = avalon_master_address[9];
	assign LEDR[8] = avalon_master_address[8];
	assign LEDR[0+:8] = mem_out;
	_HEX_screen hex0(HEXes[0+:7],avalon_master_address[0+:4]),hex1(HEXes[7+:7],avalon_master_address[4+:4]);
	_HEX_screen hex2(HEXes[14+:7],mem_out[0+:4]),hex3(HEXes[21+:7],mem_out[4+:4]);
	_HEX_screen hex4(HEXes[28+:7],sw2[0+:4]),hex5(HEXes[35+:7],sw2[4+:4]);
	
	always @(posedge clock or posedge reset)begin
		if(reset)begin
			avalon_master_chipselect <= 1'b0;
			avalon_master_address <= 10'b0000000000;
			avalon_master_read <= 1'b0;
			avalon_master_write <= 1'b0;
			avalon_master_writedata <= 8'b00000000;
			mem_out <= 8'b00000000;
			refresh <= 1'b0;
		end else begin
			sw1 <= Switches;
			key1 <= ~Keys;
			sw2 <= sw1;
			key2 <= key1;
			counter <= counter + 1;
			if(counter>30) refresh <= 1'b1;
			if(key0_edge)begin 
				avalon_master_address <= avalon_master_address + 1;
				refresh <= 1'b1;
				counter <= 6'b000000;
			end else if(key1_edge) begin
				avalon_master_address <= avalon_master_address - 1;
				refresh <= 1'b1;
				counter <= 6'b000000;
			end else if(key2_edge) begin
				avalon_master_address <= sw2;
				refresh <= 1'b1;
				counter <= 6'b000000;
			end
		end
	end
endmodule
