`timescale 1ns/1ns
module MUX32_2to1(data1, data2, select, data_o);
input  [31:0] data1;
input  [31:0] data2;
input         select;
output [31:0] data_o;
assign data_o = (select == 0)?data1:data2;
endmodule