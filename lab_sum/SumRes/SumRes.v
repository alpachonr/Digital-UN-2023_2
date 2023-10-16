/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */
/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */

module sum (
  input B,
  input A,
  input Cin,
  output Cout,
  output S
);
  assign S = ((B ^ A) ^ Cin);
  assign Cout = ((A & B) | ((B | A) & Cin));
endmodule

/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */

module bcd7seg_hex (
  input a1,
  input b1,
  input c1,
  input d1,
  output a,
  output b,
  output c,
  output d,
  output e,
  output f,
  output g
);
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  assign s0 = ~ a1;
  assign s1 = ~ b1;
  assign s2 = ~ c1;
  assign s3 = ~ d1;
  assign a = ((s0 & s1 & s2 & d1) | (a1 & s1 & c1 & d1) | (a1 & b1 & s2) | (b1 & s2 & s3));
  assign b = ((s0 & b1 & s2 & d1) | (a1 & c1 & d1) | (a1 & b1 & s3) | (b1 & c1 & s3));
  assign c = ((s0 & s1 & c1 & s3) | (a1 & b1 & s3) | (a1 & b1 & c1));
  assign d = ((s0 & s1 & s2 & d1) | (s0 & b1 & s2 & s3) | (a1 & s1 & c1 & s3) | (b1 & c1 & d1));
  assign e = ((s0 & d1) | (s0 & b1 & s2) | (s1 & s2 & d1));
  assign f = ((s0 & s1 & d1) | (s0 & s1 & c1) | (s0 & c1 & d1) | (a1 & b1 & s2));
  assign g = ((s0 & s1 & s2) | (s0 & b1 & c1 & d1));
endmodule

