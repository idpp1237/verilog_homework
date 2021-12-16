module multiplicand(multiplicand_i,wrctrl,rst,alusrc1);
input wrctrl,rst;
input [31:0]multiplicand_i;
output reg [31:0]alusrc1;

always@(*)
begin
if(rst)
 alusrc1=32'b0000_0000_0000_0000_0000_0000_0000_0000;
else if(wrctrl)
alusrc1=multiplicand_i;
end
endmodule
