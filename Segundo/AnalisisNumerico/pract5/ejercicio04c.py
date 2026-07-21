import numpy as np
from ejercicio01 import intenumcomp

def fun(x):
    return (1+x**2)**(3/2)

# Utilice la formula del error para obtener el valor de n
n_trapecio = 231
print("Usando la regla del Trapecio tenemos que la integral es " + str(intenumcomp(fun, 0, 1, n_trapecio, "trapecio")))
print("Se necesito n = " + str(n_trapecio) + " para obtener esta integral con un error menor a 1e-5\n")

# Utilice la formula del error para obtener el valor de n
n_simpson = 10
print("Usando la regla de Simpson tenemos que la integral es " + str(intenumcomp(fun, 0, 1, n_simpson, "simpson")))
print("Se necesito n = " + str(n_simpson) + " para obtener esta integral con un error menor a 1e-5")