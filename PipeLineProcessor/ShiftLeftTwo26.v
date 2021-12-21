`timescale 1ns/1ns
module ShiftLeftTwo26(data_i, data_o);
input  [25:0] data_i;
output [27:0] data_o;
assign data_o = {data_i[25:0], 2'b00};
endmodule