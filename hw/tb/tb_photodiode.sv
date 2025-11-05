`timescale 1ns/1ps
module tb_photodiode;
  real vin;
  real vout;
logic clk;

  // Instanciamos el módulo
  photodiode dut (
    .vout(vout),
    .vin(vin),
    .clk(clk)
  );

  // Generación del reloj de muestreo
  initial begin
    clk = 0;
    forever #1 clk = ~clk; // periodo de 2 ns
  end

  // Estímulos para vin
  initial begin
    $monitor ("%0t|Clock = %5.f| Entrada=%.5f| Salida=%.5f",$time,clk,vin,vout);
    vin = 0.0;
    #30000 $finish;
  end
endmodule
