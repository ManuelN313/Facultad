#Metodo de Biseccion
from ejercicio01 import rbisec
import numpy as np
import matplotlib.pyplot as plt

#Datos Funcion 2A para [4.4, 4.65]  
def fun_lab2ej2a(x):
    return 2*x-np.tan(x)
    
hxa, hya = rbisec(fun_lab2ej2a, [4.4, 4.65], 1e-5, 100)
print("El metodo va a converger en " + str(len(hxa)) + " iteraciones para el intervalo [4.4, 4.65]")
print("Aproximaciones de la Raiz: ")
print(hxa)

#Grafico Funcion 2A para [4.4, 4.65]
def grafico2a (graf, hx, hy):
    x = np.linspace(graf[0], graf[1], 30)
    plt.plot(x, 2*x-np.tan(x), label="2x-tan(x)")
    plt.plot(hx, hy, label='Aproximaciones')
    plt.plot(hx[len(hx)-1], hy[len(hy)-1], label='Mejor Aproximacion', color='white', 
    marker="o", markersize=5, markeredgecolor="red", markerfacecolor="red")
    plt.plot(x, x-x, color='black')
    
    plt.grid() 
    plt.xlabel('Eje X')
    plt.ylabel('Eje Y')
    plt.title('Metodo de Biseccion')
    plt.legend();
    plt.show()
    
grafico2a([3,6], hxa, hya)  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
