module button(wout, oclk, rst,in1);//
input oclk, rst,in1;
output wout;
reg wout;
reg ina,inb,inc,ind,inbuffer;
initial
inbuffer=0;
always @(posedge oclk)
begin
	if(~in1)
	inbuffer<=0;
	if(!rst) 
	wout <= 0;
	else if(in1&~inbuffer)
	begin
	wout <= 1;
	inbuffer<=1;
	end
	else
	wout <= 0;
	
end
endmodule