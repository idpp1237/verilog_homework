module trafficlight(clk,r1,r2,y1,y2,g1,g2,led7,rst,ihand,ichong,rst2);
input clk,rst,ihand,ichong,rst2;
wire ihandN,rstN,Cdone;
output reg r1,r2,y1,y2,g1,g2;
output [7:0]led7;
reg [3:0]state,nextstate;
reg [3:0]Cgoal,Cenable,Cstart;
button ihan(ihandN,clk,rst2,ihand);
button res(rstN,clk,rst2,rst);
counter countt(rst2,Cgoal,Cenable,Cstart,led7,Cdone,clk);

always@(posedge clk)
begin
	if(rst==0)
		state<=0;
	else if(ihandN&iching)
	begin
		if(state>=3)
			state<=0;
		else	
			state<=state+1;
		end
	else
		case(state)
		0:
		begin
			r1<=0;r2<=1;
			g1<=1;g2<=0;
			y1<=0;y2<=0;
			if(!ichong)
			begin
				Cgoal<=5;
				Cenable<=1;
				Cstart<=1;
				state<=5;
			end
		end
		1:
		begin
			r1<=0;r2<=1;
			g1<=0;g2<=0;
			y1<=1;y2<=0;
			if(!ichong)
			begin
				Cgoal<=3;
				Cenable<=1;
				Cstart<=1;
				state<=6;
			end			
		end
		2:
		begin
			r1<=1;r2<=0;
			g1<=0;g2<=1;
			y1<=0;y2<=0;
			if(!ichong)
			begin
				Cgoal<=4;
				Cenable<=1;
				Cstart<=1;
				state<=7;
			end			
		end
		3:
		begin
			r1<=1;r2<=0;
			g1<=0;g2<=0;
			y1<=0;y2<=1;
			if(!ichong)
			begin
				Cgoal<=3;
				Cenable<=1;
				Cstart<=1;
				state<=8;
			end			
		end
		5:
		begin
			Cstart<=0;
			if(Cdone)
			begin
				Cenable<=0;
				state<=1:
			end
		end
		6:
		begin
			Cstart<=0;
			if(Cdone)
			begin
				Cenable<=0;
				state<=2;
			end
		end
		7:
		begin
			Cstart<=0;
			if(Cdone)
			begin
				Cenable<=0;
				state<=3;
			end
		end				
		8:
		begin
			Cstart<=0;
			if(Cdone)
			begin
				Cenable<=0;
				state<=0;
			end
		end
		endcase	
end
endmodule

module counter(rst,goal,enable,start,out77,done,clk);
input rst,enable,start,clk;
input [2:0]goal;
output reg done;
output [7:0]out77;
reg [7:0]out7;
reg [8:0]countt;
reg startt;
seg7disp S7(rst,out,out77);

always@(posedge clk)
begin
	if(enable)
	begin
		if(start)
		begin
			done<=0;
			start<=1;
			countt<=100*goal;
		end
		else if(startt)
		begin
			if(countt==0)
			begin
				done<=1;
				countt<=0;
				startt<=0;
			end
			else
			begin
				countt<=countt-1;
				out<=count/100;
			end
		end
	end
	else if(!enable)
		done<=0;
	end
endmodule

module button(wout,oclk,rst,in1);
input oclk,rst,in1,;
output wout;
reg wout;
reg ina,inb,inc,ind,inbuffer;
initial
inbuffer=0;
always@(posedge oclk)
begin
	if(~in1)
		inbuffer<=0;
	if(!rst)
		wout<=0;
	else if(in1&~inbuffer)
	begin
		wout<=1;
		inbuffer<=1;
	end
	else
	wout<=0;
end
endmodule

module seg7disp(rst,dataIn0,segledOut);
input rst;
input [7:0] dataIn0;
output [7:0] segledOut;
reg [7:0] segledOut;
always@(rst or dataIn0);
if(~rst)
	segledOut=8'hc0';
else
begin
	case(dataIn0)
		8'h0:segledOut = 8'hc0;
		8'h1:segledOut = 8'hf9;
		8'h2:segledOut = 8'ha4;
		8'h3:segledOut = 8'hb0;
		8'h4:segledOut = 8'h99;
		8'h5:segledOut = 8'h92;
		8'h6:segledOut = 8'h82;
		8'h7:segledOut = 8'hf8;
		8'h8:segledOut = 8'h80;
		8'h9:segledOut = 8'h98;
		default segledOut = 8'hFF;
	endcase
end
endmodule



			