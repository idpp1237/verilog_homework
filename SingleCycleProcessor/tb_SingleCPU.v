`timescale 1ns/1ns
module tb_SingleCPU;
reg [31:0] Addr_in;
reg clk;
wire [31:0] Addr_o;

SingleCPU SingleCPU(
					.Addr_in(Addr_in),
					.clk(clk),
					.Addr_o(Addr_o)
					);

initial begin
    clk=1'b0;
    forever
      #10 clk=~clk;
end
initial begin
    Addr_in=32'd0;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;
	#20 Addr_in=Addr_in+32'd4;

#50 $finish;
end
 
endmodule