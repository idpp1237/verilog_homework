`timescale 1ns/1ns
module MUX5(data1, data2, select, data_o);
input  [4:0] data1;
input  [4:0] data2;
input        select;
output [4:0] data_o;
assign data_o = (select == 0)?data1:data2;

endmodule