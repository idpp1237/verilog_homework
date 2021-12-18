module trafficlight(clk,r1,r2,y1,y2,g1,g2,led7,rst,ihand,ichong,rst2);
input clk,rst,ihand,iching,rst2;
wire 
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
			