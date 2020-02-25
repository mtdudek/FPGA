module BCD_counter(output reg [3:0] value,input rst,input clk,input count,input set_zero);
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			value <= 0;
		end
		else if (count) begin
			if (set_zero || value == 9) begin            	
				value <= 0;
			end
			else if (value < 9) begin
				value <= value + 1;
			end
		end
	end
endmodule 

module BCD_timer(output [7:0] min,output [7:0] sec, input rst, input clk);
	wire p0,p1,p2,p3;
	assign p0 = sec[0+:4]==4'd9 ? 1 : 0;
	assign p1 = sec[0+:8]==8'h59 ? 1 : 0;
	assign p2 = {min[0+:4],sec[0+:8]} == 12'h959 ? 1 : 0;
	assign p3 = {min[0+:8],sec[0+:8]} == 16'h5959 ? 1 : 0;
	BCD_counter sl(sec[0+:4],rst,clk,1'b1,p0),sh(sec[4+:4],rst,clk,p0,p1),
				ml(min[0+:4],rst,clk,p1,p2),mh(min[4+:4],rst,clk,p2,z3);
endmodule

module BCD_to_HEX_screen(output reg [6:0]screen,input [3:0]bcd_input);
	always @(*) begin
		case (bcd_input)
			4'h0		:	screen = 7'b1000000;
			4'h1		:	screen = 7'b1111001;
			4'h2		:	screen = 7'b0100100;
			4'h3		:	screen = 7'b0110000;
			4'h4		:	screen = 7'b0011001;
			4'h5		:	screen = 7'b0010010;
			4'h6		:	screen = 7'b0000010;
			4'h7		:	screen = 7'b1111000;
			4'h8		:	screen = 7'b0000000;
			default 	:	screen = 7'b0010000;
		endcase
	end
endmodule 

module _1_BCD_adder(output [3:0] s, output c_out, input [3:0] a,b, input c_in);
	wire [3:0] c1,w1;
	assign {c_o,c1} = a + b + c_in;
	assign c_out = c1[3]&c1[2] | c1[3]&c1[1] | c_o;
	assign w1={1'b0,c_out,c_out,1'b0};
	assign s=c1 + w1;
endmodule

module _9s_com(output [3:0] s,input [3:0] a);
  assign s[0] = !a[0];
  assign s[1] = a[1];
  assign s[2] = a[1]^a[2];
  assign s[3] = !a[1]&!a[2]&!a[3];
endmodule 


module _1_BCD_substractor(output [3:0] s, output c_out, input [3:0] a,b, input c_in);
	wire [3:0] c1,w1,_b;
	_9s_com com(_b,b);
	assign {c_o,c1} = a + _b + c_in;
	assign c_out = c1[3]&c1[2] | c1[3]&c1[1] | c_o;
	assign w1 = {1'b0,c_out,c_out,1'b0};
	assign s = c1 + w1;
endmodule
