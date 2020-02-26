module _10Hz_CLOCK(output reg new_clk,input clk);
	reg [23:0] counter;
	always @(posedge clk) begin
		if (counter == 5000000) counter <= 0;
		else counter <= counter + 1;
		new_clk <= counter > 2500000 ? 1 : 0;
	end
endmodule 

module _UP_and_DOWN (output reg [39:0] counter,input clk);
	reg dir;
	reg [9:0] slider;
	always @(posedge clk) begin
		if (dir) slider <= slider << 1;
		else slider <= slider >> 1;

		if (slider == 10'h100) dir <= 0;
		else if(slider == 10'h002) dir <= 1;
		
		case (slider)
			10'b0000000001 : counter = 40'h0123456789;
			10'b0000000010 : counter = 40'h1234567898;
			10'b0000000100 : counter = 40'h2345678987;
			10'b0000001000 : counter = 40'h3456789876;
			10'b0000010000 : counter = 40'h4567898765;
			10'b0000100000 : counter = 40'h5678987654;
			10'b0001000000 : counter = 40'h6789876543;
			10'b0010000000 : counter = 40'h7898765432;
			10'b0100000000 : counter = 40'h8987654321;
			10'b1000000000 : counter = 40'h9876543210;
			default : slider <= 10'b0000000010;
		endcase
	end
endmodule

module _Cnt_to_Cmp (output reg [9:0] cmp,input [3:0] cnt);
	always @(*) begin
		case (cnt)
			4'd0 : cmp = 10'h3ff;
			4'd1 : cmp = 10'h3ff;
			4'd2 : cmp = 10'h3ff;
			4'd3 : cmp = 10'h3ff;
			4'd4 : cmp = 10'h3ff;
			4'd5 : cmp = 10'h3fc;
			4'd6 : cmp = 10'h3f0;
			4'd7 : cmp = 10'h3c0;
			4'd8 : cmp = 10'h300;
			4'd9 : cmp = 10'h000; 
			default : cmp = 10'h000;
		endcase
	end
endmodule

module _edge_detector(output reg was_edge, input clk, input signal);
	reg lstate;
	always @(posedge clk) begin
		case ({lstate,signal})
			2'b01 : was_edge = 1;
			default : was_edge = 0;
		endcase
		lstate <= signal;
	end
endmodule 