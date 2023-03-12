`timescale 1ns / 1ps

module _CLA(s,cout,a,b,cin);
input[3:0]a,b;
input cin;
output[3:0]s;
output cout;
wire [3:0]g,p,c;
wire [9:0]d;

and and1(g[0],a[0],b[0]);
and and2(g[1],a[1],b[1]);
and and3(g[2],a[2],b[2]);
and and4(g[3],a[3],b[3]);

xor xor1(p[0],a[0],b[0]);
xor xor2(p[1],a[1],b[1]);
xor xor3(p[2],a[2],b[2]);
xor xor4(p[3],a[3],b[3]);

and and5(d[0],p[0],cin);

and and6(d[1],p[1],g[0]);
and and7(d[2],p[1],p[0],cin);

and and8(d[3],p[2],g[1]);
and and9(d[4],p[2],p[1],g[0]);
and and10(d[5],p[2],p[1],cin);

and and11(d[6],p[3],g[2]);
and and12(d[7],p[3],p[2],g[1]);
and and13(d[8],p[3],p[2],p[1],g[0]);
and and14(d[9],p[3],p[2],p[1],p[0],cin);

or or1(c[0],g[0],d[0]);
or or2(c[1],g[1],d[1],d[2]);
or or3(c[2],g[2],d[3],d[4],d[5]);
or or4(c[3],g[3],d[6],d[7],d[8],d[9]);

xor xor5(s[0],p[0],cin);
xor xor6(s[1],p[1],c[0]);
xor xor7(s[2],p[2],c[1]);
xor xor8(s[3],p[3],c[2]);

assign cout = c[3]; 

endmodule
