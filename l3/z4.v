module t_latch(output reg q, input rst,input clk,input s);
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			q <= 0;
		end
		else if (s) begin
			q <= ~q;
		end
	end
endmodule

module _4bit_counter (	output reg [3:0] cnt,output reg prop,
						input rst,input clk,input dir,input zero, input carry);
	wire r0,w0,w1,w2;
	reg z;
	assign r0 = rst | z;
	assign w0 = (dir^cnt[0])&carry;
	assign w1 = (dir^cnt[1])&w0;
	assign w2 = (dir^cnt[2])&w1;
	assign prop = (dir^cnt[3])&(dir^cnt[2])&(dir^cnt[1])&(dir^cnt[0]);
	t_latch c0(cnt[0],r0,clk,carry),c1(cnt[1],r0,clk,w0),c2(cnt[2],r0,clk,w1),c3(cnt[3],r0,clk,w2);
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			z <= 0;
		end
		else if (zero) begin
			z <= 1;
		end
		else begin
			z <= 0;
		end
	end
	assign all_zeros=~(|cnt);
	assign all_ones=&cnt ;
endmodule 

module _16bit_counter (	output reg [15:0] cnt, input rst, input clk, input zero, input dir);
	wire car0,car1,car2,w0,w1;
	assign w0 = car1&car0;
	assign w1 = car2&car1&car0;
	_4bit_counter 	c0(cnt[0+:4],car0,rst,clk,dir,zero,1),c1(cnt[4+:4],car1,rst,clk,dir,zero,car0),
					c2(cnt[8+:4],car2,rst,clk,dir,zero,w0),c3(cnt[12+:4],,rst,clk,dir,zero,w1);
endmodule

module _PWM(output reg pwm, input [15:0] top, input [15:0] comp, input clk, input rst, input pol, input mode);
	reg [15:0]internal;
	reg zero;
	reg dir;
	_16bit_counter counter(internal,rst,clk,zero,dir);
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			zero <= 0;
			dir <= 0;
		end
		else if (mode) begin
			if (internal == top) dir <= 1;
			else if (internal == 0) dir <= 0;
		end
		else begin
			if (internal == top) zero <= 1;
			else zero <= 0;
		end
	end
	assign pwm = (internal < comp ? 0 : 1)^pol;
endmodule