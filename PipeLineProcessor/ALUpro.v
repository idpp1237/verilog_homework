module ALUpro(
src1,
src2,
operation,
result,
zero);
input [31:0]src1,src2;
input [5:0]operation;
output reg [31:0]result;
output reg zero;

always@(*)
begin
case(operation)
7:
begin
result<=src1+src2;
if(result==0)
zero<=0;
end
14:begin
result<=src1-src2;
if(result==0)
zero<=0;
end
21:
begin
result<=src1&src2;
if(result==0)
zero<=0;
end
28:
begin
result<=src1|src2;
if(result==0)
zero<=0;
end
default:;
endcase
end 
endmodule
