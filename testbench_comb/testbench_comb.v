`timescale 10ns / 1ns

`include "comb_str.v"
`include "comb_dataflow.v"
`include "comb_prim.v"
`include "comb_behavior.v"

module testbench_comb();

reg p_A, p_B, p_C, p_D;
wire str, dataflow, behavior, prim;

wire bA, bB, bC, bD;
buf ba(bA, p_A);
buf bb(bB, p_B);
buf bc(bC, p_C);
buf bd(bD, p_D);

initial 
begin
{p_D, p_C, p_B, p_A} = 4'b0;
forever
#5 {p_D, p_C, p_B, p_A} = {p_D, p_C, p_B, p_A} + 1;
end

comb_str cstr(str, bA, bB, bC, bD);
comb_dataflow cdataflow(dataflow, bA, bB, bC, bD);
comb_behavior cbehavior(behavior, bA, bB, bC, bD);
comb_prim cprim(prim, bA, bB, bC, bD);

initial
$monitor("time: %tns", $time, "DCBA = %4b, str = %b, dataflow = %b, behavior = %b, prim = %b", {p_D, p_C, p_B, p_A}, str, dataflow, behavior, prim);

endmodule