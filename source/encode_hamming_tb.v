module encode_hamming_tb;
reg [7:0]in_data;
wire [11:0] encode_data;

encode_hamming inst0(in_data,encode_data);

initial 
$monitor("in_data=%b,encode_data=%b", in_data,encode_data);

initial 
begin
#00 in_data=8'b1010_1111;
#10 $stop;
end
endmodule


module decode_hamming_tb;
reg [11:0]in_data;
wire [7:0] decode_data;
wire [3:0] C;

decode_hamming inst0(decode_data,in_data,C);
initial 
$monitor("in_data=%b,decode_data=%b,C=%b",in_data,decode_data,C);

initial 
begin
#00 in_data=12'b1010_0100_0111;
#10 $stop;
end
endmodule
