module LED_Matrix_Driver(clk,reset,datain,dataout);

input clk,reset;
input [63:0] datain;
output reg [15:0]dataout;

reg [2:0] state;

always@(posedge clk )
begin
if(reset) begin
			state = 3'd0;
			dataout = 16'b00000000_00000000;  // all light off
		   end
else begin
     case(state)
	  3'b000:begin		
				dataout[0] = 1'b1; dataout[7] = 1'b0;
				dataout[8]=(datain[0]==1'b1)? 1'b1:1'b0;
				dataout[9]=(datain[1]==1'b1)? 1'b1:1'b0;
				dataout[10]=(datain[2]==1'b1)? 1'b1:1'b0;
				dataout[11]=(datain[3]==1'b1)? 1'b1:1'b0;
				dataout[12]=(datain[4]==1'b1)? 1'b1:1'b0;
				dataout[13]=(datain[5]==1'b1)? 1'b1:1'b0;
				dataout[14]=(datain[6]==1'b1)? 1'b1:1'b0;
				dataout[15]=(datain[7]==1'b1)? 1'b1:1'b0;
				state = state + 3'd1;
	         end
		3'b001:begin
	            dataout[1] = 1'b1; dataout[0] = 1'b0;
				dataout[8]=(datain[8]==1'b1)? 1'b1:1'b0;
				dataout[9]=(datain[9]==1'b1)? 1'b1:1'b0;
				dataout[10]=(datain[10]==1'b1)? 1'b1:1'b0;
				dataout[11]=(datain[11]==1'b1)? 1'b1:1'b0;
				dataout[12]=(datain[12]==1'b1)? 1'b1:1'b0;
				dataout[13]=(datain[13]==1'b1)? 1'b1:1'b0;
				dataout[14]=(datain[14]==1'b1)? 1'b1:1'b0;
				dataout[15]=(datain[15]==1'b1)? 1'b1:1'b0;
				state = state + 3'd1;
	         end
		3'b010:begin
	            dataout[2] = 1'b1; dataout[1] = 1'b0;
				dataout[8]=(datain[16]==1'b1)? 1'b1:1'b0;
				dataout[9]=(datain[17]==1'b1)? 1'b1:1'b0;
				dataout[10]=(datain[18]==1'b1)? 1'b1:1'b0;
				dataout[11]=(datain[19]==1'b1)? 1'b1:1'b0;
				dataout[12]=(datain[20]==1'b1)? 1'b1:1'b0;
				dataout[13]=(datain[21]==1'b1)? 1'b1:1'b0;
				dataout[14]=(datain[22]==1'b1)? 1'b1:1'b0;
				dataout[15]=(datain[23]==1'b1)? 1'b1:1'b0;
				state = state + 3'd1;
	         end
		3'b011:begin
	            dataout[3] = 1'b1; dataout[2] = 1'b0;
				dataout[8]=(datain[24]==1'b1)? 1'b1:1'b0;
				dataout[9]=(datain[25]==1'b1)? 1'b1:1'b0;
				dataout[10]=(datain[26]==1'b1)? 1'b1:1'b0;
				dataout[11]=(datain[27]==1'b1)? 1'b1:1'b0;
				dataout[12]=(datain[28]==1'b1)? 1'b1:1'b0;
				dataout[13]=(datain[29]==1'b1)? 1'b1:1'b0;
				dataout[14]=(datain[30]==1'b1)? 1'b1:1'b0;
				dataout[15]=(datain[31]==1'b1)? 1'b1:1'b0;
				state = state + 3'd1;
	         end	
		3'b100:begin
	            dataout[4] = 1'b1; dataout[3] = 1'b0;
				dataout[8]=(datain[32]==1'b1)? 1'b1:1'b0;
				dataout[9]=(datain[33]==1'b1)? 1'b1:1'b0;
				dataout[10]=(datain[34]==1'b1)? 1'b1:1'b0;
				dataout[11]=(datain[35]==1'b1)? 1'b1:1'b0;
				dataout[12]=(datain[36]==1'b1)? 1'b1:1'b0;
				dataout[13]=(datain[37]==1'b1)? 1'b1:1'b0;
				dataout[14]=(datain[38]==1'b1)? 1'b1:1'b0;
				dataout[15]=(datain[39]==1'b1)? 1'b1:1'b0;
				state = state + 3'd1;
	         end	
		3'b101:begin
	            dataout[5] = 1'b1; dataout[4] = 1'b0;
				dataout[8]=(datain[40]==1'b1)? 1'b1:1'b0;
				dataout[9]=(datain[41]==1'b1)? 1'b1:1'b0;
				dataout[10]=(datain[42]==1'b1)? 1'b1:1'b0;
				dataout[11]=(datain[43]==1'b1)? 1'b1:1'b0;
				dataout[12]=(datain[44]==1'b1)? 1'b1:1'b0;
				dataout[13]=(datain[45]==1'b1)? 1'b1:1'b0;
				dataout[14]=(datain[46]==1'b1)? 1'b1:1'b0;
				dataout[15]=(datain[47]==1'b1)? 1'b1:1'b0;
				state = state + 3'd1;
	         end
		3'b110:begin
	            dataout[6] = 1'b1; dataout[5] = 1'b0;
				dataout[8]=(datain[48]==1'b1)? 1'b1:1'b0;
				dataout[9]=(datain[49]==1'b1)? 1'b1:1'b0;
				dataout[10]=(datain[50]==1'b1)? 1'b1:1'b0;
				dataout[11]=(datain[51]==1'b1)? 1'b1:1'b0;
				dataout[12]=(datain[52]==1'b1)? 1'b1:1'b0;
				dataout[13]=(datain[53]==1'b1)? 1'b1:1'b0;
				dataout[14]=(datain[54]==1'b1)? 1'b1:1'b0;
				dataout[15]=(datain[55]==1'b1)? 1'b1:1'b0;
				state = state + 3'd1;
	         end
	    3'b111:begin
	            dataout[7] = 1'b1; dataout[6] = 1'b0;
				dataout[8]=(datain[56]==1'b1)? 1'b1:1'b0;
				dataout[9]=(datain[57]==1'b1)? 1'b1:1'b0;
				dataout[10]=(datain[58]==1'b1)? 1'b1:1'b0;
				dataout[11]=(datain[59]==1'b1)? 1'b1:1'b0;
				dataout[12]=(datain[60]==1'b1)? 1'b1:1'b0;
				dataout[13]=(datain[61]==1'b1)? 1'b1:1'b0;
				dataout[14]=(datain[62]==1'b1)? 1'b1:1'b0;
				dataout[15]=(datain[63]==1'b1)? 1'b1:1'b0;
				state = state + 3'd1;
	         end				
		
	  endcase		
     end
end

endmodule