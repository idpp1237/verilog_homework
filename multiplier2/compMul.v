
module compMul(multiplicand_i,srtctrl1,multiplier_i,clk,run,rst,product,ready);
input clk,rst,run;
input [31:0]multiplicand_i,multiplier_i;
output [63:0]product;
output ready,srtctrl1;
wire rst,overflow,addctrl,wrctrl,srtctrl,lsb;
wire [31:0]alusrc1,alusrc2,alu_o;
product product1(.product(product),.overflow(overflow),.run(run),.alu_o(alu_o),.wrctrl(wrctrl),.rst(rst),.lsb(lsb),.ready(ready),.alusrc2(alusrc2),.multiplier_i(multiplier_i),.srtctrl(srtctrl),.clk(clk));
control control1(.run(run),.rst(rst),.wrctrl(wrctrl),.addctrl(addctrl),.srtctrl(srtctrl),.lsb(lsb),.ready(ready),.clk(clk));
multiplicand multiplicand(.multiplicand_i(multiplicand_i),.wrctrl(wrctrl),.rst(rst),.alusrc1(alusrc1));
ALUnew alunew(.alusrc2(alusrc2),.alusrc1(alusrc1),.addctrl(addctrl),.alu_o(alu_o),.overflow(overflow));
assign srtctrl1=srtctrl;
endmodule