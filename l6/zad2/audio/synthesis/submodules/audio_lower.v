// audio_lower.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module audio_lower #(
		parameter BITS = 24
	) (
		input  wire        clock_sink_clk,         //        clock.clk
		input  wire        reset,                  //        reset.reset
		input  wire [23:0] sink_data,              //         sink.data
		output wire        sink_ready,             //             .ready
		input  wire        sink_valid,             //             .valid
		output reg [23:0] source_data,            //       source.data
		input  wire        source_ready,           //             .ready
		output reg        source_valid,           //             .valid
		output wire [7:0]  avalon_slave_readdata,  // avalon_slave.readdata
		input  wire        avalon_slave_write,     //             .write
		input  wire [7:0]  avalon_slave_writedata  //             .writedata
	);
	
	reg [7:0] inside;
	
	always @(posedge clock_sink_clk or posedge reset) begin
		if (reset) begin
			source_data <= 0;
			source_valid <= 1'b0;
			inside <= 0;
		end else begin
			if (avalon_slave_write)
				inside <= avalon_slave_writedata;
			if (sink_valid && source_ready) begin
				source_data <= $signed(sink_data) >>> inside;
				source_valid <= 1'b1;
			end else
				source_valid <= 1'b0;
		end
	end
	assign sink_ready = source_ready;
	assign avalon_slave_readdata = inside;

endmodule
