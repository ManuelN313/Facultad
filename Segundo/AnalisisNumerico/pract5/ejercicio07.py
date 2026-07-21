import numpy as np
import time
from ejercicio01 import intenumcomp

def fun(x):
    return x*np.e**(-(x**2))

def simpson_simple(f, a, b):
    return ((b-a)/6) * (f(a) + 4*f((a+b)/2) + f(b))

def simpson_plus(f, a, b, e):
    c = (a+b)/2
    q = simpson_simple(f, a, b)
    q1 = simpson_simple(f, a, c)
    q2 = simpson_simple(f, c, b)
    if (abs(q-q1-q2) < 15*e):
        return q1+q2
    else:
        return simpson_plus(f, a, c, e) + simpson_plus(f, c, b, e)

e = float(input("Ingresar Tolerencia e: "))

inicio1 = time.time()
simpson_p = simpson_plus(fun, 0, 1, e)
fin1 = time.time()

valor_real = (1/2)*(1-(1/np.e))
n = 2
inicio2 = time.time()
simpson_c = intenumcomp(fun, 0, 1, n, "simpson")
while (abs(simpson_c - valor_real) >= 15*e):
    n = n + 2
    simpson_c = intenumcomp(fun, 0, 1, n, "simpson")
fin2 = time.time()

print("\nEl valor calculado por el nuevo metodo es " + str(simpson_p) + " y se tardo un total de " + str(fin1 - inicio1) + " segundos")
print("El valor calculado por el metodo compuesto de Simpson es " + str(simpson_c) + " y se tardo un total de " + str(fin2 - inicio2) + " segundos")

# Si la tolerencia se encuentra entre 1e-1 y 1e-20 el primer metodo es más rapido que el segundo. 
# Pero si la tolerencia es menor a 1e-20 se empieza a ver que el primer metodo es mucho mas lento que el segundo.