`timescale 1ns/1ns
module Sign_Extend(data_i, data_o);
input  [15:0] data_i;
output [31:0] data_o;


assign data_o = (data_i[15] == 0)?{16'd0, data_i}:{16'd65535, data_i};
endmodule