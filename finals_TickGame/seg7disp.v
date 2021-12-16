module seg7disp(rst,dataIn0, segLedOut);//7seg

input rst;
input [7:0] dataIn0;
output [7:0] segLedOut;
reg [7:0] segLedOut;
always @(rst or dataIn0)
if(~rst)
	segLedOut = 8'hc0;
else
	begin
		case(dataIn0)
			8'h0: segLedOut = 8'hc0;
			8'h1: segLedOut = 8'hf9;
			8'h2: segLedOut = 8'ha4;
			8'h3: segLedOut = 8'hb0;
			8'h4: segLedOut = 8'h99;
			8'h5: segLedOut = 8'h92;
			8'h6: segLedOut = 8'h82;
			8'h7: segLedOut = 8'hf8;
			8'h8: segLedOut = 8'h80;
			8'h9: segLedOut = 8'h98;
			default:  segLedOut = 8'hFF;
		endcase
	end
endmodule
