module SingleCPU(
Addr_in,
clk,
Addr_o);
wire [4:0]RDaddr;
wire [2:0] ALUOp;
wire [31:0]Instruction,Sign,RTdata,result,Readdata,XX,src1,RDdata;
wire [5:0]operation;
input [31:0]Addr_in;
input clk;
output  [31:0]Addr_o;

Adder Adder1(.data1(Addr_in), .data2(32'b100), .data_o(Addr_o));

ALU_Control ALU_Control(
.funct(Instruction[5:0]),
.ALUOp(ALUOp),
.operation(operation));

ALUpro ALU_pro1(
.src1(RDdata),
.src2(XX),
.operation(operation),
.result(result),
.zero(zero));

Control Control1(
.Op(Instruction[31:26]),
.RegDst(RegDst),
//.Jump(Jump), 			//????J-type?????
//.Branch(Branch), 			//????J-type?????
.MemRead(MemRead),
.MemtoReg(MemtoReg),
.ALUOp(ALUOp), 			//output [2:0]
.MemWrite(MemWrite),
.ALUSrc(ALUSrc),
.RegWrite(RegWrite));

Data_Memory Data_Memory1(.clk(clk), .addr(result), .data(RTdata), .MemRead(MemRead), .MemWrite(MemWrite), .DM_data(Readdata));

InstructionMemory InstructionMemory1(.Addr_in(Addr_in),.instr(Instruction[31:0])); 

MUX5 MUX51(.data1(Instruction[20:16]), .data2(Instruction[15:11]), .select(RegDst), .data_o(RDaddr));

MUX32_2to1 MUX32_2to11(.data1(RTdata), .data2(Sign), .select(ALUSrc), .data_o(XX));//

MUX32_2to1 MUX32_2to12(.data1(Readdata), .data2(result), .select(MemtoReg), .data_o(src1));

Register Register1 ( 
  .clk(clk), 
  .RSaddr(Instruction[25:21]),  //Read register1 
  .RTaddr(Instruction[20:16]),  //Read register2 
  .RDaddr(RDaddr),   //Write register 
  .RDdata(RDdata),  // Read data1 
  .RTdata(RTdata),  // Read data2 
  .RegWrite(RegWrite),   //Control signal 
  .src1(src1));  //Write data
//ShiftLeftTwo26 ShiftLeftTwo261
//ShiftLeftTwo32 ShiftLeftTwo321
Sign_Extend Sign_Extend1(.data_i(Instruction[15:0]), .data_o(Sign));//


endmodule


