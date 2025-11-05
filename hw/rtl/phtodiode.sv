`timescale 1ns/1ps
module photodiode(vout, vin, clk);

output real vout;
input real vin;
input clk;

real vout_prev, vin_prev;

parameter real id  = 50e-6;
parameter real cs  = 100e-12;
parameter real rsh = 1e9;
parameter real rf  = 20e3;
parameter real cf  = 10e-12;
parameter real TS  = 1;
parameter real TU  = 1e-9;

real dt, A, B, C, D;

initial begin
  dt = TS * TU;
  vout = 0.0;
  vin_prev = 0.0;
  vout_prev = 0.0;
end

always @(posedge clk) begin
  A = 1.0 / rf;
  B = 1.0 / rsh;
  C = cf / dt;
  D = cs / dt;

  vout = (1.0 / (A + C)) *
         ((A + B + C + D) * vin - (C + D) * vin_prev + C * vout_prev + id);

  vin_prev  = vin;
  vout_prev = vout;
end

endmodule
