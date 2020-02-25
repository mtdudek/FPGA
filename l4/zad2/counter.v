module count_sec(output reg new_clk, input clk, input count);
	reg [31:0]cnt;
	always @(posedge clk) begin
		if(cnt == 32'd49999999) cnt <= 0;
		else if (count) cnt <= cnt + 1;
		if (cnt == 0) new_clk <= 0;
		else if (cnt == 32'd25000000) new_clk <= 1;
	end
endmodule 