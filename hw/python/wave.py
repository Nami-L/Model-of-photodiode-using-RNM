import pandas as pd
import matplotlib.pyplot as plt

# Cargar datos
df = pd.read_csv('/home/nami/Documents/Model-of-photodiode-using-RNM/work/uvm/sim/simulation_results.csv')
# buscar columna  con el nombre tiempo
time = df['time']
# buscar la columan con el nombre vout
vout = df ['vout']
# Graficar
plt.figure(figsize=(10, 5)) #crear una figura de 10x5 pulgadas

plt.plot(time,vout, label='Vout (RNM Model)') #graficar vout vs tiempo
plt.title('Respuesta del Fotodiodo')
plt.xlabel('Tiempo')
plt.ylabel('Voltaje [V]')
plt.grid(True)
plt.legend()
plt.show()