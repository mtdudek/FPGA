module prio_encoder2(output valid,number, input i0,i1);
	wire ni0;
	or v0(valid,i0,i1);
	not n0(ni0,i0);
	and num0(number,valid,ni0); 
endmodule

module prio_encoder4(output valid,output [1:0]number, input i0,i1,i2,i3);
	wire v0,v1,n0,n1,nv0,f;
	prio_encoder2 p0(v0,n0,i0,i1),p1(v1,n1,i2,i3);
	or v0(valid,v0,v1);
	not num1(number[1],v0);
	and f0(f,number[1],n1);
	or num0(number[0],n0,f);
endmodule