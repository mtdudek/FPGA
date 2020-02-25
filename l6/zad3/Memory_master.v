// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module new_component (
		output reg [9:0]  avalon_master_address,     // avalon_master.address
		output reg        avalon_master_read,        //              .read
		input  wire [7:0]  avalon_master_readdata,    //              .readdata
		output reg        avalon_master_write,       //              .write
		output reg [7:0]  avalon_master_writedata,   //              .writedata
		output reg        avalon_master_chipselect,  //              .chipselect
		input  wire        avalon_master_waitrequest, //              .waitrequest
		input  wire        clock_sink_clk,            //    clock_sink.clk
		input  wire        reset_sink_reset,          //    reset_sink.reset
		output reg [9:0]  LEDR,                      //   conduit_end.id10xled
		output reg [41:0] HEXes,                     //              .id6xhexscreen
		input  wire [9:0]  Switches,                  //              .id10xswitch
		input  wire [3:0]  Keys                       //              .id4xkey
	);
	
	always @(posedge clock_sink_clk or posedge reset_sink_reset)begin
		if(reset_sink_reset)begin
			avalon_master_chipselect <= 1'b0;
			avalon_master_address <= 10'b0000000000;
			avalon_master_read <= 1'b0;
			avalon_master_write <= 1'b0;
			avalon_master_writedata <= 8'b00000000;
			HEXes <= 42'b000000000000000000000000000000000000000000;
			LEDR <= 10'b0000000000;
		end else begin
			
		end
	end


endmodule
