module SingleCPU(
Addr_in,
clk,
Addr_o);
input [31:0]Addr_in;
input clk;
output  [31:0]Addr_o;

//O
wire [31:0]intrO;
//A
wire [31:0]intrA;
wire [31:0]SignexA;
wire RegWriteA,MemToRegA,	MemReadA,MemWriteA,RegDstA,ALUSrcA;
wire [31:0]ReadData1A,ReadData2A;
wire [2:0]ALUOpA;
//B
wire RegWriteB,MemToRegB,	MemReadB,MemWriteB,RegDstB,ALUSrcB;
wire [2:0]ALUOpB;
wire [31:0]ReadData1B,ReadData2B;
wire [20:0]instrB;

wire [31:0]SignexB;
wire [31:0]mux321B;
wire [5:0]ALUopB;
wire [4:0]mux5B;
wire [31:0]ALUresultB;

//C
wire MemReadC,MemWriteC,RegWriteC,MemToRegC;
wire [31:0]ALUresultC;
wire [31:0]ReadData2C;
wire [31:0]ReaddataC;
wire [4:0]mux5C;
//D
wire RegWriteD,MemToRegD;
wire [31:0]ReaddataD;
wire [31:0]ALUresultD;
wire [31:0]mux322D;
wire [4:0]mux5D;

//
Adder Adder1(.data1(Addr_in),
 .data2(32'b100),
 .data_o(Addr_o));
//////////////////


InstructionMemory InstructionMemory1(.Addr_in(Addr_in),
.instr(intrO)); 
IFID IFID1(.intr(intrO),.intrReg(intrA),.clk(clk));
Register Register1 ( 
 .clk(clk), 
 .RSaddr(intrA[25:21]),  //Read register1 
 .RTaddr(intrA[20:16]),  //Read register2 
 .RDaddr(mux5D),   //Write register 
 .RDdata(ReadData1A),  // Read data1 
 .RTdata(ReadData2A),  // Read data2 
 .RegWrite(RegWriteD),   //Control signal 
 .src1(mux322D));  //Write data

Sign_Extend Sign_Extend1(.data_i(intrA[15:0]),
.data_o(SignexA));//
Control Control1(
.Op(intrA[31:26]),
.RegDst(RegDstA),
.MemRead(MemReadA),
.MemtoReg(MemToRegA),
.ALUOp(ALUOpA), 			
.MemWrite(MemWriteA),
.ALUSrc(ALUSrcA),
.RegWrite(RegWriteA));


IDEX IDEX1(.RegWrite(RegWriteA),.MemToReg(MemToRegA),.MemRead(MemReadA),.MemWrite(MemWriteA),.RegDst(RegDstA),.ALUOp(ALUOpA),.ALUSrc(ALUSrcA),
	.clk(clk),.RegWriteREG(RegWriteB),.MemToRegREG(MemToRegB),.MemReadREG(MemReadB),.MemWriteREG(MemWriteB),.RegDstREG(RegDstB),.ALUOpREG(ALUOpB),.ALUSrcREG(ALUSrcB),
	.ReadData1(ReadData1A),.ReadData2(ReadData2A),.SignEx(SignexA),.In2016(intrA[20:16]),.IN1511(intrA[15:11]),
	.ReadData1REG(ReadData1B),.ReadData2REG(ReadData2B),.SignExREG(SignexB),.In2016REG(instrB[20:16]),.IN1511REG(instrB[15:11]));
MUX32_2to1 MUX32_2to11(.data1(ReadData2B),
.data2(SignexB),
.select(ALUSrcB),
.data_o(mux321B));//
MUX5 MUX51(.data1(instrB[20:16]),
.data2(instrB[15:11]),
.select(RegDstB), 
.data_o(mux5B));
ALU_Control ALU_Control(
.funct(SignexB[5:0]),
.ALUOp(ALUOpB),
.operation(ALUopB));

ALUpro ALU_pro1(
.src1(ReadData1B),
.src2(mux321B),
.operation(ALUopB),
.result(ALUresultB),
.zero(a));

EXMEM EXMEM1(.RegWrite(RegWriteB),.MemToReg(MemToRegB),.MemRead(MemReadB),.MemWrite(MemWriteB),.clk(clk),.RegWriteREG(RegWriteC),.MemToRegREG(MemToRegC),.MemReadREG(MemReadC),.MemWriteREG(MemWriteC)
,.ALUresult(ALUresultB),.ReadData2(ReadData2B),.intr2011(mux5B),.ALUresultREG(ALUresultC),.ReadData2REG(ReadData2C),.intr2011REG(mux5C));

Data_Memory Data_Memory1(.clk(clk), 
.addr(ALUresultC),
.data(ReadData2C),
.MemRead(MemReadC),
.MemWrite(MemWriteC),
.DM_data(ReaddataC));
MEMWB MEMWB1(.RegWrite(RegWriteC),.MemToReg(MemToRegC),.clk(clk),.RegWriteREG(RegWriteD),.MemToRegREG(MemToRegD),.ReadData(ReaddataC),.ALUresult(ALUresultC),.intr2011(mux5C),.ReadDataREG(ReaddataD),.ALUresultREG(ALUresultD),.intr2011REG(mux5D));
MUX32_2to1 MUX32_2to12(.data1(ReaddataD),
.data2(ALUresultD),
.select(MemToRegD),
.data_o(mux322D));
















endmodule


