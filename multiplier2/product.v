module product(product,overflow,alu_o,wrctrl,rst,run,lsb,ready,alusrc2,multiplier_i,srtctrl,clk);
input clk,rst,srtctrl,wrctrl,ready,overflow,run;
input [31:0]multiplier_i;
input [31:0]alu_o;
output reg [63:0]product;
output reg[31:0]alusrc2;
output reg lsb;

always@(posedge clk,posedge rst)
begin
if(rst)
begin
	product=0;
end
else if(run)
product<={32'b0000_0000_0000_0000_0000_0000_0000_0000,multiplier_i};
else if(srtctrl&&wrctrl)
begin
	product<={overflow,alu_o,product[31:1]};
end
else if(srtctrl)
 begin
 product <=product>>1;
 end

end 
always@(product)
begin
alusrc2<=product[63:32];
lsb<=product[0];
end

endmodule

