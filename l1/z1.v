primitive d_flipflop(output reg out, input clk,input d);
	table
		(01) 0 : ? : 0;
		(01) 1 : ? : 1;
		(1?) ? : ? : -;
		(?0) ? : ? : -;
		? (??) : ? : -;
	endtable
endprimitive

module multiplex_4(output out, input s0,s1,s2,s3,c0,c1);
	wire nc0,nc1,w0,w1,w2,w3,o0,o1,o2,o3,ic0,ic1;
	not con0(nc0,c0),con1(nc1,c1);
	and g0(w0,nc0,nc1),g1(w1,c0,nc1),g2(w2,nc0,c1),g3(w3,c0,c1);
	and go0(o0,s0,w0),go1(o1,s1,w1),go2(o2,s2,w2),go3(o3,s3,w3);
	or or0(ic0,o0,o1),or1(ic1,o2,o3),or2(out,ic0,ic1);
endmodule

module jk_flipflop(output out, input clk, j,k);
	wire nq,feedback;
	d_flipflop cel(out,clk,feedback);
	not neg(nq,out);
	multiplex_4 mul4(feedback,out,1,0,nq,j,k);
endmodule

module ups;
	reg clk,j,k;
	wire out;	
	jk_flipflop jk(out,clk,j,k);
	initial begin
		clk = 0;
		j = 0;
		k = 0;
		#1 clk = 1;
		j = 1;
		#1 clk = 0;
		#1 clk = 1;
		j = 0;
		#1 clk = 0;
		#1 clk = 1;
		k = 1;
		#1 clk = 0;
		#1 clk = 1;
		j = 1;
		#1 clk = 0;
		#1 clk = 1;
		#1 clk = 0;
		#1 clk = 1;
		#1 clk = 0;
		#1 clk = 1;
	end
	initial $monitor($time, " out=%d clk=%d j=%d k=%d",
					out, clk, j, k);
endmodule