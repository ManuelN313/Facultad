import numpy as np
from ejercicio01 import intenumcomp

def fun(x):
    return x*(np.e**(-x))

valor_verdadero = 1 - 2/np.e

n = 1
while (abs(valor_verdadero - intenumcomp(fun, 0, 1, n, "trapecio")) >= 1e-5):
    n = n+1

print("Usando la regla del Trapecio tenemos que la integral es " + str(intenumcomp(fun, 0, 1, n, "trapecio")))
print("Se necesito n = " + str(n) + " para obtener esta integral con un error menor a 1e-5\n")

n = 2
while (abs(valor_verdadero - intenumcomp(fun, 0, 1, n, "simpson")) >= 1e-5):
    n = n+2

print("Usando la regla de Simpson tenemos que la integral es " + str(intenumcomp(fun, 0, 1, n, "simpson")))
print("Se necesito n = " + str(n) + " para obtener esta integral con un error menor a 1e-5")