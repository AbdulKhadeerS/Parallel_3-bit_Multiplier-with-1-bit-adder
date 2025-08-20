module orgate
  (input  a,
   input  b,
   output y);
  wire n22_o;
  assign y = n22_o;
  /* orgate.vhd:13:12  */
  assign n22_o = a | b;
endmodule

module halfadder
  (input  a,
   input  b,
   output sum,
   output carry);
  wire n19_o;
  wire n20_o;
  assign sum = n19_o;
  assign carry = n20_o;
  /* halfadder.vhd:13:10  */
  assign n19_o = a ^ b;
  /* halfadder.vhd:14:11  */
  assign n20_o = a & b;
endmodule

module fulladder
  (input  A,
   input  B,
   input  Carry_in,
   output Sum,
   output Carry_out);
  wire w_sum;
  wire w_carry1;
  wire w_carry2;
  wire module1_n2;
  wire module1_n3;
  wire module1_sum;
  wire module1_carry;
  wire module2_n8;
  wire module2_n9;
  wire module2_sum;
  wire module2_carry;
  wire module3_n14;
  wire module3_y;
  assign Sum = module2_n8;
  assign Carry_out = module3_n14;
  /* fulladder.vhd:12:8  */
  assign w_sum = module1_n2; // (signal)
  /* fulladder.vhd:13:8  */
  assign w_carry1 = module1_n3; // (signal)
  /* fulladder.vhd:13:18  */
  assign w_carry2 = module2_n9; // (signal)
  /* fulladder.vhd:31:8  */
  assign module1_n2 = module1_sum; // (signal)
  /* fulladder.vhd:32:10  */
  assign module1_n3 = module1_carry; // (signal)
  /* fulladder.vhd:28:1  */
  halfadder module1 (
    .a(A),
    .b(B),
    .sum(module1_sum),
    .carry(module1_carry));
  /* fulladder.vhd:37:8  */
  assign module2_n8 = module2_sum; // (signal)
  /* fulladder.vhd:38:10  */
  assign module2_n9 = module2_carry; // (signal)
  /* fulladder.vhd:34:1  */
  halfadder module2 (
    .a(w_sum),
    .b(Carry_in),
    .sum(module2_sum),
    .carry(module2_carry));
  /* fulladder.vhd:43:6  */
  assign module3_n14 = module3_y; // (signal)
  /* fulladder.vhd:40:1  */
  orgate module3 (
    .a(w_carry2),
    .b(w_carry1),
    .y(module3_y));
endmodule

