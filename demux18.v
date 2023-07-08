module demux(i,e,s,f);
input i,e;
input [0:2]s;
wire [0:7]d;
output [0:7]f;
assign d[0] = (s==3'b000) ? i:0;
assign d[1] = (s==3'b001) ? i:0;
assign d[2] = (s==3'b010) ? i:0;
assign d[3] = (s==3'b011) ? i:0;
assign d[4] = (s==3'b100) ? i:0;
assign d[5] = (s==3'b101) ? i:0;
assign d[6] = (s==3'b110) ? i:0;
assign d[7] = (s==3'b111) ? i:0;
assign f = e ? d:0;
endmodule

module demux_tb();
reg i,e;
reg [0:2] s;
wire [0:7] f;
demux P(i,e,s,f);
initial begin
$dumpfile("part1.vcd");
$dumpvars;
end
initial begin
 $monitor("i=%b, e=%b, s=%3b, output=%8b", i, e, s, f);
#5 i = 1; e=0; s[0:2]=3'b000;
#5 i = 1; e=0; s[0:2]=3'b001;
#5 i = 1; e=0; s[0:2]=3'b010;
#5 i = 1; e=0; s[0:2]=3'b011;
#5 i = 1; e=0; s[0:2]=3'b100;
#5 i = 1; e=0; s[0:2]=3'b101;
#5 i = 1; e=0; s[0:2]=3'b110;
#5 i = 1; e=0; s[0:2]=3'b111;
#5 i = 1; e=1; s[0:2]=3'b000;
#5 i = 1; e=1; s[0:2]=3'b001;
#5 i = 1; e=1; s[0:2]=3'b010;
#5 i = 1; e=1; s[0:2]=3'b011;
#5 i = 1; e=1; s[0:2]=3'b100;
#5 i = 1; e=1; s[0:2]=3'b101;
#5 i = 1; e=1; s[0:2]=3'b110;
#5 i = 1; e=1; s[0:2]=3'b111;
#40 $finish;
end
endmodule