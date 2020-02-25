module alu_8bit(output reg [7:0]out, input [7:0]in1,in2, input [1:0] func, input neg);
	reg [7:0] inter_connect,vec;
	always @* begin
		case(func)
			2'b00 : inter_connect = in1 + in2;
			2'b01 : inter_connect = in1 - in2;
			2'b10 : inter_connect = in1 & in2;
			2'b11 : inter_connect = in1 | in2;
		endcase
		vec = {8{neg}};
		out = inter_connect ^ vec;
	end
endmodule

module benchmark ();
	reg [7:0] mem [0:1023];
	reg [7:0] in1,in2,fuu,ans;
	reg [1:0] func;
	reg neg;
	wire [7:0] out;
	reg [11:0] instruction_counter;
	alu_8bit test_sub(out,in1,in2,func,neg);
	initial begin
		instruction_counter = 0;
		$readmemh("test.data", mem);
		in1 = mem[4*instruction_counter];
		in2 = mem[4*instruction_counter+1];
		fuu = mem[4*instruction_counter+2];
		ans = mem[4*instruction_counter+3];
		while (in1 != 8'hff || in2 != 8'hff || fuu != 8'hff || ans != 8'hff ) begin
			func = fuu[5:4];
			neg = fuu[0];
			$display("%h %h %h %h %h",in1,in2,fuu,ans,func);
			#1 if(out != ans) begin
				$display("Something went wrong %h %h %h %h %h",in1,in2,fuu,out,ans);
				$finish;
			end
			#1 instruction_counter = instruction_counter + 1;
			in1 = mem[4*instruction_counter];
			in2 = mem[4*instruction_counter+1];
			fuu = mem[4*instruction_counter+2];
			ans = mem[4*instruction_counter+3];
		end
		$display("done");
		#1 $finish;
	end
endmodule