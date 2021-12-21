module ALU_Control(
funct,
ALUOp,
operation);
input[5:0]funct;
input [2:0]ALUOp;
output reg [5:0]operation;

always@(*)
begin
case(ALUOp)
2:begin
	case(funct)
	9:operation<=7;
	18:operation<=14;
	27:operation<=21;
	36:operation<=28;
	default:;
	endcase
	end
0:operation<=7;
1:operation<=14;
default:;
endcase
end
endmodule

