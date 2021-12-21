module IFID(intr,clk,intrReg);
input clk;
input [31:0]intr;
output reg [31:0]intrReg;

always@(posedge clk)
begin
intrReg=intr;
end
endmodule