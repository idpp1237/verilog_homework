module EXMEM(RegWrite,MemToReg,MemRead,MemWrite,clk,RegWriteREG,MemToRegREG,MemReadREG,MemWriteREG
		,ALUresult,ReadData2,intr2011,ALUresultREG,ReadData2REG,intr2011REG);
input clk;
input RegWrite,MemToReg,	MemRead,MemWrite;
input [31:0]ALUresult,ReadData2;
input [4:0]intr2011;
output reg RegWriteREG,MemToRegREG,	MemReadREG,MemWriteREG;
output reg[31:0]ALUresultREG,ReadData2REG;
output reg[4:0]intr2011REG;
always@(posedge clk)
begin
//WB
RegWriteREG=RegWrite;
MemToRegREG=MemToReg;
//M
MemReadREG=MemRead;
MemWriteREG=MemWrite;
//else
ALUresultREG=ALUresult;
ReadData2REG=ReadData2;
intr2011REG=intr2011;
end
endmodule