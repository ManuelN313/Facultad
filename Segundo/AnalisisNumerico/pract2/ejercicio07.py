from ejercicio01 import rbisec
from ejercicio03 import rnewton
from ejercicio05 import ripf
import numpy as np
import matplotlib.pyplot as plt
import math

def lab2ej7bisec(x):
	fun_auxiliar = lambda y : y - math.exp(-(1-x*y)**2) 
	#Esto de aca arriba es lo mismo que hacer:
	#   def fun_auxiliar(y): -> No es necesario tomar x como valor de entrada, pues nos viene de arriba
	#		return y - math.exp(-(1-x*y)**2)  
	hy, hu = rbisec(fun_auxiliar, [0.0,2.0], 1e-6, 100)
	y = hy[-1]
	return y

def lab2ej7newton(x):
	fun_auxiliar = lambda y : (y - math.exp(-(1-x*y)**2), \
		1 - math.exp(-(1-x*y)**2)*(-2*(1-x*y)*(-x)))
	hy, hu = rnewton(fun_auxiliar, 1.0, 1e-6, 100)
	y = hy[-1]
	return y

def lab2ej7ipf(x):
	fun_auxiliar = lambda y : math.exp(-(1-x*y)**2)
	hy = ripf(fun_auxiliar, 1.0, 1e-6, 100)
	y = hy[-1]
	return y

hx = []
hy = [] 
for x in range (0, 150): #Evaluo los valores de y para [0, 1.5]
	k = float(x/100)
	hx.append(k)
	hy.append(lab2ej7ipf(k)) #Eligo la funcion que yo quiera para hacerlo
	

def grafico (graf, hx, hy):
    x = np.linspace(graf[0], graf[1], 30)
    plt.plot(hx, hy, label = "y-e^(-(1-xy)^2)")
    plt.plot(x, x-x, color = 'black')
    
    plt.grid() 
    plt.xlabel('Eje X')
    plt.ylabel('Eje Y')
    plt.legend();
    plt.show()
    
grafico([-2,2], hx, hy)  







