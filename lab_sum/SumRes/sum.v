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
