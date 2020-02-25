module _ram(output reg[15:0] q,input clk, input we, input[9:0] addr, input [15:0] data);
	reg [15:0] mem [1024];
	always @(posedge clk) begin
		q <= mem[addr-1];
		if (we) begin 
			mem[addr] <= data;
		end
	end
endmodule 

module stack(	output empty, output single, output reg [15:0]top,
					input push, input pop, input write, input [15:0] data, input clk, input rst);
	reg [9:0]pointer;
	wire [15:0] second;
	_ram mem(second,clk,push,pointer,top);
	assign empty = pointer == 0 ? 1 : 0;
	assign single = pointer == 1 ? 1 : 0;
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			pointer <= 0;
			top <= 0;
		end else begin
			if(push && pointer < 1023) begin
				top <= data;
				pointer <= pointer + 1;
			end else if (write) begin
				top <= data;
			end else if (pop && pointer > 0) begin
				top <= second;
				pointer <= pointer - 1;
			end
		end
	end
endmodule

module _HEX_screen(output reg [6:0]screen,input [3:0] data);
	always @(*) begin
		case(data)
			4'h0 : screen = 7'b1000000;
			4'h1 : screen = 7'b1111001;
			4'h2 : screen = 7'b0100100;
			4'h3 : screen = 7'b0110000;
			4'h4 : screen = 7'b0011001;
			4'h5 : screen = 7'b0010010;
			4'h6 : screen = 7'b0000010;
			4'h7 : screen = 7'b1111000;
			4'h8 : screen = 7'b0000000;
			4'h9 : screen = 7'b0010000;
			4'ha : screen = 7'b0001000;
			4'hb : screen = 7'b0000011;
			4'hc : screen = 7'b1000110;
			4'hd : screen = 7'b0100001;
			4'he : screen = 7'b0000110;
			4'hf : screen = 7'b0001110;
			default : screen = 7'h00;
		endcase
	end
endmodule 

module _final_state_machine(	output pop,write,push, output reg [15:0] inner, 
										input clk, input rst, input [15:0]stack_top, input [15:0]sw,input add, mult, insert, single, empty);
	reg [2:0] state;
	reg _add;
	assign pop = state == 2 ? 1 : 0;
	assign write = state == 4 ? 1 : 0;
	assign push = state == 6 ? 1 : 0;
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			state <= 0;
			_add <= 0;
			inner <= 0;
		end else begin
			if (state == 0) begin
				if (insert)
					state <= 5;
				else if ((add || mult) && !(empty || single)) begin
					if (add) _add <= 1;
					state <= 1;
				end
			end else if(state == 1) begin
				inner <= stack_top;
				state <= 2;
			end else if (state == 2) begin
				state <= 3;
			end else if (state == 3) begin
				if (_add)
					inner <= inner + stack_top;
				else
					inner <= inner * stack_top;
				state <= 4;
			end else if (state == 4) begin
				_add <= 0;
				state <= 0;
			end else if (state == 5) begin
				inner <= sw;
				state <= 6;
			end else if (state == 6) begin
				state <= 0;
			end
		end
	end
endmodule 