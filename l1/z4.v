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

module testbench;
	reg clk,rst;
	wire w2,w3,no0,no2,i0,i1,r1,r2;
	wire [3:0] out;
	and aw2(w2,out[0],out[1]),
		aw3(w3,out[2],w2);
	T_switch 	b0(out[0],clk,r2,1),
				b1(out[1],clk,r2,out[0]),
				b2(out[2],clk,r2,w2),
				b3(out[3],clk,r2,w3);
	not n0(no0,out[0]),
		n1(no2,out[2]);
	and a0(i0,no0,out[1]),
		a1(i1,no2,out[3]),
		a2(r1,i0,i1);
	or reset(r2,rst,r1);
	initial begin
		#3 rst = 1;
		#3 rst = 0;
	end

	always begin
		#1 clk = 1;
		#1 clk = 0; 
		$monitor($time, " out=%d ",out);
	end
	initial $monitor($time, " out=%d ",out);
endmodule