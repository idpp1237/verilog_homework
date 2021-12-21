
module Control(
Op,
RegDst,
//Jump, //????J-type?????
//Branch, //????J-type?????
MemRead,
MemtoReg,
ALUOp, //output [2:0]
MemWrite,
ALUSrc,
RegWrite);

input [5:0]Op;
output reg RegDst,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
output reg [2:0]ALUOp;

always@(*)
begin
case(Op)
6'd20:		//
begin
RegDst=1;
MemRead=0;
MemtoReg=1;//MUX_dir
ALUOp=2;
MemWrite=0;
ALUSrc=0;
RegWrite=1;
end
6'd41:
begin		//SW
RegDst=0;
MemRead=0;
MemtoReg=0;//MUX_dir
ALUOp=0;
MemWrite=1;
ALUSrc=1;
RegWrite=0;
end
6'd42:		//LW
begin
RegDst=0;
MemRead=1;
MemtoReg=0;//MUX_dir
ALUOp=0;
MemWrite=0;
ALUSrc=1;
RegWrite=1;
end
6'd39:		//Addi
begin
RegDst=0;
MemRead=0;
MemtoReg=1;//MUX_dir
ALUOp=0;
MemWrite=0;
ALUSrc=1;
RegWrite=1;
end
6'd40:		//Subi
begin
RegDst=0;
MemRead=0;
MemtoReg=1;//MUX_dir
ALUOp=1;
MemWrite=0;
ALUSrc=1;
RegWrite=1;
end

6'd25:		//beq no
begin
RegDst=1;
MemRead=0;
MemtoReg=1;//MUX_dir
ALUOp=0;
MemWrite=0;
ALUSrc=1;
RegWrite=1;
end
6'd26:		//j no
begin
RegDst=1;
MemRead=0;
MemtoReg=1;//MUX_dir
ALUOp=0;
MemWrite=0;
ALUSrc=1;
RegWrite=1;
end
default:;

endcase
end
endmodule


