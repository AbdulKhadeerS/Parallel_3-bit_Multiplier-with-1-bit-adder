module dff (
    input wire D,       // 1-bit input
    input wire CLK,     // Clock input
    input wire RST,     // Asynchronous reset
    output reg Q        // 1-bit output
);

always @(posedge CLK or posedge RST) begin
Q <= 1'b0;
    if (RST)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule
