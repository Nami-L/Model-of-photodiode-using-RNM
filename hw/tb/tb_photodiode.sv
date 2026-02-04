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

  integer file;
initial begin
    file = $fopen("simulation_results.csv", "w");
    $fdisplay(file, "time,vin,vout"); // Encabezado
    
    forever begin
        @(vout or vin); // Cada que cambie una señal
        $fdisplay(file, "%t,%f,%f", $realtime, vin, vout);
    end
end

final begin
    $fclose(file);
end
endmodule
