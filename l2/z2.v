module enkoder_1 (output [1:0] out,output valid, input a0,a1,a2,a3);
	assign valid = (a0|a1)|(a2|a3);
	assign out = {~(a0|a1),~(a0|a1)&(a3&~a2)|(a1&~a0)};
endmodule

module enkoder_2 (output reg [1:0] out,output reg valid, input a0,a1,a2,a3);
	always @* begin
		valid = (a0|a1)|(a2|a3);
		out[1] = ~(a0|a1);
		out[0] = (~a0&a1)|~(a0|a1)&(~a2&a3);
	end
endmodule

module benchmark ();
	reg [3:0]counter;
	wire [1:0] out0,out1;
	wire a0,a1,a2,a3;
	assign {a0,a1,a2,a3} = counter;
	wire v0,v1;
	enkoder_1 mod1(out0,v0,a0,a1,a2,a3);
	enkoder_2 mod2(out1,v1,a0,a1,a2,a3);
	initial begin
		#1 counter = 0;
		repeat (2**4) begin
			#1 counter = counter + 1;
		end
		#1 $finish;
	end
	initial $monitor($time, "out0=%b v0=%d, out1=%b v1=%d",out0,v0,out1,v1);
endmodule