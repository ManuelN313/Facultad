#Metodo de Biseccion
from ejercicio01 import rbisec
import numpy as np
import matplotlib.pyplot as plt

#Datos Funcion 2B para [-2.0, -1.0]
def fun_lab2ej2b(x):
    return x**2-3
    
hxb, hyb = rbisec(fun_lab2ej2b, [-2.0, -1.0], 1e-5, 100) 
print("El metodo va a converger en " + str(len(hxb)) + " iteraciones para el intervalo [-2.0, -1.0]")
print("Aproximaciones de la Raiz: ")
print (hxb)   

#Grafico Funcion 2B para [-2.0, -1.0]
def grafico2b (graf, hx, hy):
    x = np.linspace(graf[0], graf[1], 30)
    plt.plot(x, x**2-3, label=" x^2-3")
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
    
grafico2b([-3,3], hxb, hyb)  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
