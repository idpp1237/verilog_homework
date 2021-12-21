
module Register(
clk,
RSaddr, //Read register1
RTaddr, //Read register2
RDaddr, //Write register
RDdata, // Read data1
RTdata, // Read data2
RegWrite, //Control signal
src1); //Write data

input clk,RegWrite;
input [4:0]RTaddr,RSaddr,RDaddr;
output reg [31:0]RDdata,RTdata;
input [31:0]src1;
reg [31:0]Register[31:0];

initial 
begin
Register[0]=0;
Register[1]=75;
Register[2]=543;
Register[3]=74;
Register[4]=57;
Register[5]=29;
Register[6]=77;
Register[7]=83;
Register[8]=117;
Register[9]=82;
Register[10]=37;
Register[11]=53;
Register[12]=43;
Register[13]=107;
Register[14]=122;
Register[15]=305;
Register[16]=123;
Register[17]=171;
Register[18]=307;
Register[19]=24;
Register[20]=32;
Register[21]=75;
Register[22]=369;
Register[23]=374;
Register[24]=75;
Register[25]=75;
Register[26]=74;
Register[27]=369;
Register[28]=22;
Register[29]=500;
Register[30]=1000;
Register[31]=21;
end

always@(negedge clk)//
begin
if(RegWrite)
	begin
	Register[RDaddr]=src1;
	end
end

always@(RTaddr,RSaddr,RDaddr)
begin
RDdata=Register[RSaddr];
RTdata=Register[RTaddr];
end
endmodule




