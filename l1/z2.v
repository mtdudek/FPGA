primitive T_switch(output reg out, input clk, input rst,input en);
	table
		//reset on
		?	 1	  ?		: ? : 0;
		?	 1	  (??)	: ? : 0;
		(??) 1 	  ? 	: ? : 0;
		// change on reset
		? 	 (??) ?		: ? : -;
		//reset off
		(01) 0 	  0 	: ? : -;
		(01) 0 	  1 	: 0 : 1;
		(01) 0 	  1 	: 1 : 0;
		(1?) 0 	  ? 	: ? : -;
		(?0) 0 	  ? 	: ? : -;
		? 	 0 	  (??)	: ? : -;
	endtable
endprimitive


module test;
	reg clk,rst,en;
	wire out;
	T_switch testing(out,clk,rst,en);
	initial begin
		#3 rst = 1;
		en = 1;
		clk = 0;
		#3 rst = 0;
		#1 clk = 1;
		#1 clk = 0;
		#1 clk = 1;
		#1 clk = 0;
		#1 clk = 1;
		#1 clk = 0;
		#1 clk = 1;
		#1 clk = 0;
		#1 clk = 1;
		en = 0;
		#1 clk = 0;
		#1 clk = 1;
		#1 clk = 0;
		#1 clk = 1;
	end
	initial $monitor($time, " out=%d rst=%d clk=%d en=%d",
					out, rst, clk, en);



endmodule
