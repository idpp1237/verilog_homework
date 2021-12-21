`timescale 1ns/1ns
module Data_Memory(clk, addr, data, MemRead, MemWrite, DM_data);
  
input MemRead,MemWrite,clk;
input [31:0]addr,data;
output [31:0]DM_data;
reg [7:0] Mem [127:0];
reg semW;
reg [31:0]savedata,saveaddr;

assign DM_data = (MemRead==1'b1)?{Mem[addr[6:0]], Mem[addr+1], Mem[addr+2], Mem[addr+3]}:32'b0;

integer i;
initial begin
  for (i=0;i<128;i=i+1) begin
    Mem[i] = 8'b0;
  end
  semW = 1'b0;
  savedata = 32'b0;
  saveaddr = 32'b0;
end

always@(negedge clk)begin
		if(MemWrite==1'b1) begin
		 
  		  
			Mem[addr] <= data[31:24];
			Mem[addr+1] <= data[23:16];
			Mem[addr+2] <= data[15:8];
			Mem[addr+3] <= data[7:0];
    		end
			
			end  
//always@(posedge clk)begin
  //  if(MemWrite==1'b1) begin
 //   semW <= 1'b1;
  // 
  //  end
   // else 
   // semW <= 1'b0;
//end  

endmodule
