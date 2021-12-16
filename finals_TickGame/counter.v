module counter(rst,goal,enable,start,out77,done,clk);///?????
input rst,enable,start,clk;
input [2:0]goal;
output reg done;
output [7:0]out77;
reg [7:0]out7;
reg [11:0]countt;
reg startt;
seg7disp S7(rst,out7, out77);

always@(posedge clk)
begin
 if(enable)
	begin
		if(start)
		begin
		done<=0;
		startt<=1;
		countt<=2500;
		end
		else if(startt)
			begin
				if(countt==0)// 100hz =>> 1s=100clk
					begin
					done<=1;		//finish
					countt<=0;		//reset
					startt<=0;		//close
					end
				
				else
				begin
					countt<=countt-1;//count
					out7<=countt/500; //output X's
				end
			end
		end
	else if(!enable)
		done<=0;
	end
		endmodule