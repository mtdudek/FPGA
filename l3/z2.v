module parity_counter(output reg out, input clk,rst,in);
	reg ones,zeros;
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			ones <= 0;
			zeros <= 0;
		end
		else begin
			if (in) ones <= ~ones;
			else zeros <= ~zeros;
		end
	end
	assign out = ones ~| zeros;
endmodule