module andgate
  (input  A,
   input  B,
   output Y);
  wire n1_o;
  assign Y = n1_o;
  /* andgate.vhd:21:8  */
  assign n1_o = A & B;
endmodule

