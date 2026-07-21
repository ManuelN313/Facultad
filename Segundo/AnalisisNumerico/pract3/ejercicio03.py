from ejercicio02 import inewton 
import matplotlib.pyplot as plt
import numpy as np

z = []
for i in range (1, 102):
    aux = 24/25 + i/25
    z.append(aux)

x = [1, 2, 3, 4, 5]
y = [1, 1/2, 1/3, 1/4, 1/5]

w = inewton(x, y, z)

def grafico(hx, hy):
    x = np.linspace(0, 5, 300)
    plt.plot(hx, hy, label='Polinomio Interpolante de Newton para 1/x')
    plt.plot(x, 1/x, label="1/x")
    
    plt.grid() 
    plt.xlabel('Eje X')
    plt.ylabel('Eje Y')
    plt.title('Ejercicio 3')
    plt.legend();
    plt.show()
    
grafico(z, w)  

