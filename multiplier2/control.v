module control(run,rst,wrctrl,addctrl,srtctrl,lsb,ready,clk);
input run,clk,rst,lsb;
output reg srtctrl,wrctrl,ready,addctrl;
reg [6:0]count;
reg k;

always@(posedge clk,posedge rst)
	begin
if(rst)
begin
count<=0;
ready<=0;
k<=0;

end
else if(run)
	begin
	k<=1;
	end
else if(count==31)
	begin
		count<=0;
		ready<=1;
		k<=0;
	end
else if(k)
	begin
		count<=count+1;
	end

end
always@(lsb,ready,rst)
begin
	if(rst)
	begin
		wrctrl<=0;
		addctrl<=0;
		srtctrl<=0;
	end
	else if(ready)
	begin
		wrctrl<=0;
		addctrl<=0;
		srtctrl<=0;
	end
	else if(k&&lsb)
	begin
		wrctrl<=1;
		addctrl<=1;
		srtctrl<=1;
	end
	else if(!lsb&&k)
	begin
		addctrl<=0;
		srtctrl<=1;
		wrctrl<=0;
	end
end

endmodule

