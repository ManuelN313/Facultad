import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt("./datos1a.dat", delimiter = "\t")

xi = []
yi = []

for points in data:
    xi.append(points[0])
    yi.append(points[1])

# Buscamos una aproximacion de la forma: y = a1x+a0.
# Voy a utilizar la formula de cuadrados minimos para calcular los coeficientes a1 y a0
# Usando esta formula voy a tener que calcular 5 sumatorias y resolver un sistema lineal 2x2
# Calculo sumatorias
a11 = len(xi)
aux = np.ones(a11)
a12 = np.dot(xi, aux)
a22 = np.dot(xi, xi)
b1 = np.dot(yi, aux)
b2 = np.dot(yi, xi)

# Resuelvo Sistema Lineal
a21 = a12
a12 = a12/a11
b1 = b1/a11

a22 = a22 - a21*a12
b2 = b2 - a21*b1

a1 = b2/a22
a0 = (b1 - a1*a12)

def graficar(hx, hy, a, b):
    x = np.linspace(0, 5, 2)
    plt.plot(x, a*x+b, label= str(a) + "x + " + str(b))
    plt.plot(hx, hy, label = "Puntos Obtenidos")

    plt.grid() 
    plt.xlabel('Eje X')
    plt.ylabel('Eje Y')
    plt.title('Ejercicio 1b')
    plt.legend()
    plt.show()
    
graficar(xi, yi, a1, a0)  