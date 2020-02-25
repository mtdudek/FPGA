module _HEX_screen(output reg [6:0]screen,input [3:0] data);
	always @(*) begin
		case(data)
			4'h0 : screen = 7'b1000000;
			4'h1 : screen = 7'b1111001;
			4'h2 : screen = 7'b0100100;
			4'h3 : screen = 7'b0110000;
			4'h4 : screen = 7'b0011001;
			4'h5 : screen = 7'b0010010;
			4'h6 : screen = 7'b0000010;
			4'h7 : screen = 7'b1111000;
			4'h8 : screen = 7'b0000000;
			4'h9 : screen = 7'b0010000;
			4'ha : screen = 7'b0001000;
			4'hb : screen = 7'b0000011;
			4'hc : screen = 7'b1000110;
			4'hd : screen = 7'b0100001;
			4'he : screen = 7'b0000110;
			4'hf : screen = 7'b0001110;
			default : screen = 7'h00;
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