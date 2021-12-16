module ALUnew(alusrc2,alusrc1,addctrl,alu_o,overflow);
input [31:0]alusrc1,alusrc2;
input addctrl;
output reg [31:0]alu_o;
output reg overflow;
reg [32:0]a,b;
reg [32:0]z;

always@(*)
begin
if(addctrl)
	begin
a[32]=0;
b[32]=0;
	a[31:0]=alusrc1;
	b[31:0]=alusrc2;
	{overflow,alu_o}=a+b;
	end
end
endmodule

