module testparity #(parameter width=8) (output parity,input [width-1:0]data);
	assign parity = ^data;
endmodule	

module benchmark #(parameter test=8)();
	reg [test-1:0]counter,gray;
	wire ans;
	testparity mod(ans,gray);
	initial begin
		#1 counter = 0;
		repeat (2**test) begin
			#1 gray = counter ^ (counter >> 1);
			counter = counter + 1;
		end
		#1 $finish;
	end
	initial $monitor($time, " ans=%d ",ans);
endmodule