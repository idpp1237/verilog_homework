module IDEX(RegWrite,MemToReg,MemRead,MemWrite,RegDst,ALUOp,ALUSrc,
	clk,RegWriteREG,MemToRegREG,MemReadREG,MemWriteREG,RegDstREG,ALUOpREG,ALUSrcREG,
	ReadData1,ReadData2,SignEx,In2016,IN1511,
	ReadData1REG,ReadData2REG,SignExREG,In2016REG,IN1511REG);
input clk;
input [31:0]ReadData1,ReadData2,SignEx;
input	[4:0] In2016,IN1511;
input RegWrite,MemToReg,	MemRead,MemWrite,	RegDst,ALUSrc;
input [2:0]ALUOp;
output reg RegWriteREG,MemToRegREG,	MemReadREG,MemWriteREG,	RegDstREG,ALUSrcREG;
output reg[2:0]ALUOpREG;
output reg[31:0]ReadData1REG,ReadData2REG,SignExREG;
output	reg[4:0] In2016REG,IN1511REG;

always@(posedge clk)
begin
//WB
RegWriteREG=RegWrite;
MemToRegREG=MemToReg;
//M
MemReadREG=MemRead;
MemWriteREG=MemWrite;
//EX
RegDstREG=RegDst;
ALUOpREG=ALUOp;
ALUSrcREG=ALUSrc;
//else
ReadData1REG=ReadData1;
ReadData2REG=ReadData2;
SignExREG=SignEx;
In2016REG=In2016;
IN1511REG=IN1511;
end
endmodule

