`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2018 20:47:28
// Design Name: 
// Module Name: hammin_single_bit_correction
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

////////////////// hammig (n,k,t)=(12,8,1) with r=4 scheme encoder ////////////////////
module encode_hamming(in_data,encode_data);
output  [11:0] encode_data;
input [7:0] in_data;
wire [11:0] code_word;
wire p1,p2,p4,p8;

//wire m3,m5,m6,m7,m9,m10,m11,m12;
assign {m3,m5,m6,m7,m9,m10,m11,m12}=in_data;
xor xor1(p1,m3,m5,m7,m9,m11);
xor xor2(p2,m3,m6,m7,m10,m11);
xor xor3(p4,m5,m6,m7,m12);
xor xor4(p8,m9,m10,m11,m12);

assign encode_data ={p1,p2,m3,p4,m5,m6,m7,p8,m9,m10,m11,m12};
endmodule

////////////// Hamming decoder for 12 bits Code Word //////////////
module decode_hamming(decode_data,in_data,C);
output [7:0] decode_data;
output [3:0] C;
input [11:0] in_data;
wire c1,c2,c4,c8;
wire [11:0] corr_data;
wire [12:1] m;

assign {m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12]}=in_data;

xor xor1(c1,m[1],m[3],m[5],m[7],m[9],m[11]);
xor xor2(c2,m[2],m[3],m[6],m[7],m[10],m[11]);
xor xor3(c4,m[4],m[5],m[6],m[7],m[12]);
xor xor4(c8,m[8],m[9],m[10],m[11],m[12]);

assign C={c8,c4,c2,c1};

assign corr_data = c8?(c4?(c2?(c1?in_data:in_data):(c1?in_data:(in_data^12'h001))):(c2?(c1?in_data^12'h002:in_data^12'h004):(c1?in_data^12'h008:in_data^12'h010)))
     :(c4?(c2?(c1?in_data^12'h020:in_data^12'h040):(c1?in_data^12'h080:(in_data^12'h100))):(c2?(c1?in_data^12'h200:in_data^12'h400):(c1?in_data^12'h800:in_data)));
     
assign decode_data = {corr_data[9],corr_data[7:5],corr_data[3:0]};
/*
"C Value"   "bit Position"
0000 No Error! or corr_data=in_data
0001 m[1]  1000 0000 0000  = 12'h800
0010 m[2]  0100 0000 0000  = 12'h400
0011 m[3]  0010 0000 0000  = 12'h200

0100 m[4]  0001 0000 0000  = 12'h100
0101 m[5]  0000 1000 0000  = 12'h080
0110 m[6]  0000 0100 0000  = 12'h040
0111 m[7]  0000 0010 0000  = 12'h020

1000 m[8]  0000 0001 0000  = 12'h010
1001 m[9]  0000 0000 1000  = 12'h008 
1010 m[10] 0000 0000 0100  = 12'h004
1011 m[11] 0000 0000 0010  = 12'h002

1100 m[12] 0000 0000 0001  = 12'h001
1101 don't care or corr_data=in_data
1110 don't care or corr_data=in_data
1111 don't care or corr_data=in_data
*/
endmodule

