module _PWM_SAW#(parameter n=1,parameter m=10)(output[n-1:0] pwm, input [m-1:0] top, input [(m*n)-1:0] comp, input clk);
	reg [m-1:0] internal;
	
	always @(posedge clk) begin
			if (internal == top) begin
				internal <= 0;
			end else begin 
				internal <= internal + 1;
			end
	end
	generate
		genvar i;
		for(i=0; i<n; i=i+1) begin : pwm_output_comparator_generate
			assign pwm[i] = (internal > comp[(i*m)+:m] ? 1 : 0);
		end
	endgenerate
endmodule 

module _PWM_UP_and_DOWN#(parameter n=1,parameter m=10)(output[n-1:0] pwm, input [m-1:0] top, input [(m*n)-1:0] comp, input clk);
	reg [m-1:0] internal;
	reg dir;
	always @(posedge clk) begin
			if (internal == top -1)
				dir <= 0;
			else if(internal == 1) 
				dir <= 1;
				
			if (dir)
				internal <= internal + 1;
			else
				internal <= internal - 1;
	end
	generate
		genvar i;
		for(i=0; i<n; i=i+1) begin : pwm_output_comparator_generate
			assign pwm[i] = (internal > comp[(i*m)+:m] ? 1 : 0);
		end
	endgenerate
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
