module parallel_3_bit_mult (
    input  [2:0] A,
    input  [2:0] B,
    input        CLK1,
    input        RST1,
    output [5:0] P
);

    // Internal signals
    wire A0_i, A1_i, A2_i;
    wire B0_i, B1_i, B2_i;

    wire A0B0Y_s, A0B1Y_s, A0B2Y_s;
    wire A1B0Y_s, A1B1Y_s, A1B2Y_s;
    wire A2B0Y_s, A2B1Y_s, A2B2Y_s;

    wire HA1_s, HA1_c;
    wire HA2_s, HA2_c;
    wire HA3_s, HA3_c;

    wire FA1_s, FA1_co;
    wire FA2_s, FA2_co;
    wire FA3_s, FA3_co;

    // Input D Flip-Flops
    dff Module_A0 (.D(A[0]), .CLK(CLK1), .RST(RST1), .Q(A0_i));
    dff Module_A1 (.D(A[1]), .CLK(CLK1), .RST(RST1), .Q(A1_i));
    dff Module_A2 (.D(A[2]), .CLK(CLK1), .RST(RST1), .Q(A2_i));
    dff Module_B0 (.D(B[0]), .CLK(CLK1), .RST(RST1), .Q(B0_i));
    dff Module_B1 (.D(B[1]), .CLK(CLK1), .RST(RST1), .Q(B1_i));
    dff Module_B2 (.D(B[2]), .CLK(CLK1), .RST(RST1), .Q(B2_i));

    // AND Gates (Partial Products)
    andgate Module_AND1 (.A(A0_i), .B(B0_i), .Y(A0B0Y_s));
    andgate Module_AND2 (.A(A0_i), .B(B1_i), .Y(A0B1Y_s));
    andgate Module_AND3 (.A(A0_i), .B(B2_i), .Y(A0B2Y_s));
    andgate Module_AND4 (.A(A1_i), .B(B0_i), .Y(A1B0Y_s));
    andgate Module_AND5 (.A(A1_i), .B(B1_i), .Y(A1B1Y_s));
    andgate Module_AND6 (.A(A1_i), .B(B2_i), .Y(A1B2Y_s));
    andgate Module_AND7 (.A(A2_i), .B(B0_i), .Y(A2B0Y_s));
    andgate Module_AND8 (.A(A2_i), .B(B1_i), .Y(A2B1Y_s));
    andgate Module_AND9 (.A(A2_i), .B(B2_i), .Y(A2B2Y_s));

    // Half Adders
    halfadder Module_HA1 (.a(A0B1Y_s), .b(A1B0Y_s), .sum(HA1_s), .carry(HA1_c));
    halfadder Module_HA2 (.a(A0B2Y_s), .b(A1B1Y_s), .sum(HA2_s), .carry(HA2_c));
    halfadder Module_HA3 (.a(A1B2Y_s), .b(A2B1Y_s), .sum(HA3_s), .carry(HA3_c));

    // Full Adders
    fulladder Module_FA1 (.A(HA2_s), .B(A2B0Y_s), .Carry_in(HA1_c), .Sum(FA1_s), .Carry_out(FA1_co));
    fulladder Module_FA2 (.A(HA3_s), .B(FA1_co), .Carry_in(HA2_c), .Sum(FA2_s), .Carry_out(FA2_co));
    fulladder Module_FA3 (.A(A2B2Y_s), .B(FA2_co), .Carry_in(HA3_c), .Sum(FA3_s), .Carry_out(FA3_co));

    // Output D Flip-Flops
    dff Module_P0 (.D(A0B0Y_s), .CLK(CLK1), .RST(RST1), .Q(P[0]));
    dff Module_P1 (.D(HA1_s), .CLK(CLK1), .RST(RST1), .Q(P[1]));
    dff Module_P2 (.D(FA1_s), .CLK(CLK1), .RST(RST1), .Q(P[2]));
    dff Module_P3 (.D(FA2_s), .CLK(CLK1), .RST(RST1), .Q(P[3]));
    dff Module_P4 (.D(FA3_s), .CLK(CLK1), .RST(RST1), .Q(P[4]));
    dff Module_P5 (.D(FA3_co), .CLK(CLK1), .RST(RST1), .Q(P[5]));

endmodule

