module _PWM(output pwm, input [9:0] top, input [9:0] comp, input clk);
	reg [9:0] internal;
	
	always @(posedge clk) begin
			if (internal == top) begin
				internal <= 10'h000;
			end else begin 
				internal <= internal + 10'h001;
			end
	end
	assign pwm = (internal > comp ? 1 : 0);
endmodule