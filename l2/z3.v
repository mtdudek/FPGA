module enkoder #(parameter n=8)(output [n-1:0]out,output valid,input [2**n-1:0] bus);
wire [2**(n-1):0] inner_bus [n-1:0];
genvar i;
genvar j;
assign valid = |bus;
for (i = n-1 ; i >= 0; i = i - 1) begin
	for (j = 0 ; j < 2**(n - i-1) ; j = j + 1) begin
		assign inner_bus[i][j] = |bus[2**i+2*j*(2**i)+:2**i];
	end
	assign out[i] = |inner_bus[i][0+:2**(n-i-1)];
end
endmodule

module benchmark #(parameter t=4)();
	reg [2**t-1:0]in;
	wire valid;
	wire [t-1:0]o;
	enkoder #(t) test_sub(o,valid,in);
	initial begin
		#1 in = 0;
		repeat (2**(2**t)) begin
			#1 in = in + 1;
		end
		#1 $finish;
	end
	initial $monitor($time, "in=%b o=%b valid=%d",in,o,valid);
endmodule