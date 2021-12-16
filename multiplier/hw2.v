module hw2(clk,st,done,rst,buffer,count,load,sh,ad,c0,mulier,muland);
input st,clk,rst;
output reg done;
reg x;
output reg load,sh,ad;
output reg [8:0]buffer;
output reg [3:0]count;
wire [8:0]buffer1;
input [3:0]muland;
input [3:0]mulier;
input c0;
add4(buffer[7:4],muland,c0,buffer1[8],buffer1[7:4],ad);
always@(posedge clk)
if(!rst)
buffer=9'b000000000;
else if(st)
	begin
		load=1;
		end
else if(load)
begin
buffer={5'b00000,mulier};
count=4'b0100;
load=0;
	end
else if	(count!=4'b0000)
begin
	 if(buffer[0])
		begin
			ad=1;
			x=buffer[0];
			buffer[0]=0;
			end
			else if(!buffer[0])
	begin
		ad=0;
		if(x==1)
		begin
		buffer[8]=buffer1[8];
		buffer[7:4]=buffer1[7:4];
		buffer[0]=x;
		x=0;
		end
		buffer=buffer>>1;
		count=count-4'b0001;
		if(count==4'b0000)
		done=1;
	end
		end
endmodule


module add4(A,B,C0,C4,S,cont);
input [3:0]A;
input [3:0]B;
reg [2:0]C1;
input  C0,cont;
output reg C4;
output reg[3:0]S;
always@(*)
if(cont)
begin
 S[0]=A[0]^B[0]^C0;
 C1[0]=A[0]&B[0]|(A[0]^B[0])&C0;

 S[1]=A[1]^B[1]^C1[0];
 C1[1]=A[1]&B[1]|(A[1]^B[1])&C1[0];

 S[2]=A[2]^B[2]^C1[1];
 C1[2]=A[2]&B[2]|(A[2]^B[2])&C1[1];

 S[3]=A[3]^B[3]^C1[2];
 C4=A[3]&B[3]|(A[3]^B[3])&C1[2];
 end

endmodule
