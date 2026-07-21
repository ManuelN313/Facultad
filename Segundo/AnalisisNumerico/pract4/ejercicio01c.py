import numpy as np
import matplotlib.pyplot as plt

x = []
y = []

for i in range(0, 21):
    x.append(i/2)
    y.append(np.polyval([3/4, -1/2], i/2) + np.random.normal(0, 1))

result = np.polyfit(x, y, 1)

a = result[0]
b = result[1]
print("El valor de A es " + str(a) + " y el valor de B es " + str(b))

def graficar(hx, hy, a, b):
    x = np.linspace(0, 10, 2)
    plt.plot(x, a*x+b, label= str(a) + "x + " + str(b))
    plt.plot(hx, hy, label = "Puntos Obtenidos")

    plt.grid() 
    plt.xlabel('Eje X')
    plt.ylabel('Eje Y')
    plt.title('Ejercicio 1c')
    plt.legend()
    plt.show()
    
graficar(x, y, a, b)