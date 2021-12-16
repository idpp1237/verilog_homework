module clickcount(clk,click,rst,enable,out);
input clk,click,rst,enable;
output reg[7:0]out;

always@(posedge clk)
begin
	if(rst)
		out=0;
	else if(enable)
		begin
			if(click)
				out=out+1;
		end
end

endmodule				

