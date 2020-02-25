module BCD_counter(output reg [3:0] value,input rst,input clk,input count);
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			value <= 0;
		end
		else if (count) begin
        	if (value < 9) begin
				value <= value + 1;
          	end
            else begin            	
            	value <= 0;
            end
		end
	end
endmodule 

module BCD_timer(output [7:0] min,output [7:0] sec, input rst, input clk);
	wire r0,r1,r2,r3;
	wire p0,p1,p2;
	assign r0 = rst | sec[0+:4]==4'd10 ? 1 : 0;
	assign r1 = rst | sec[4+:4]==4'd6 ? 1 : 0;
	assign r2 = rst | min[0+:4]==4'd10 ? 1 : 0;
	assign r3 = rst | min[4+:4]==4'd6 ? 1 : 0;
	assign p0 = sec[0+:4]==4'd9 ? 1 : 0;
	assign p1 = sec[0+:8]==8'h59 ? 1 : 0;
	assign p2 = min[0+:4]==4'd9 ? sec[0+:8]==8'h59 ? 1 : 0 : 0;
	BCD_counter sl(sec[0+:4],r0,clk,1'b1),sh(sec[4+:4],r1,clk,p0),
				ml(min[0+:4],r2,clk,p1),mh(min[4+:4],r3,clk,p2);
endmodule
