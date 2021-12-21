module MEMWB(RegWrite,MemToReg,clk,RegWriteREG,MemToRegREG,
		ReadData,ALUresult,intr2011,ReadDataREG,ALUresultREG,intr2011REG);
input clk;
input RegWrite,MemToReg;
input [31:0]ReadData,ALUresult;
input [4:0]intr2011;

output reg RegWriteREG,MemToRegREG;
output reg[31:0]ReadDataREG,ALUresultREG;
output reg[4:0]intr2011REG;
always@(posedge clk)
begin
//WB
RegWriteREG=RegWrite;
MemToRegREG=MemToReg;
//else
ReadDataREG=ReadData;
ALUresultREG=ALUresult;
intr2011REG=intr2011;

end
endmodule
