from ejercicio01 import intenumcomp
import numpy as np

def fun(x):
    return (np.e)**(-x)

valor_real = 1 - (1/np.e)

print("El Error Absoluto del metodo de Simpson con 4 intervalos es: " + str(abs(valor_real - intenumcomp(fun, 0, 1, 4//2, "simpson"))))
print("El Error Absoluto del metodo de Simpson con 10 intervalos es: " + str(abs(valor_real - intenumcomp(fun, 0, 1, 10//2, "simpson"))))
print("El Error Absoluto del metodo de Simpson con 20 intervalos es: " + str(abs(valor_real - intenumcomp(fun, 0, 1, 20//2, "simpson"))))
print("")
print("El Error Absoluto del metodo del Trapecio con 4 intervalos es: " + str(abs(valor_real - intenumcomp(fun, 0, 1, 4, "trapecio"))))
print("El Error Absoluto del metodo del Trapecio con 10 intervalos es: " + str(abs(valor_real - intenumcomp(fun, 0, 1, 10, "trapecio"))))
print("El Error Absoluto del metodo del Trapecio con 20 intervalos es: " + str(abs(valor_real - intenumcomp(fun, 0, 1, 20, "trapecio"))))
print("")
print("El Error Absoluto del metodo del Punto Medio con 4 intervalos es: " + str(abs(valor_real - intenumcomp(fun, 0, 1, 4, "pm"))))
print("El Error Absoluto del metodo del Punto Medio con 10 intervalos es: " + str(abs(valor_real - intenumcomp(fun, 0, 1, 10, "pm"))))
print("El Error Absoluto del metodo del Punto Medio con 20 intervalos es: " + str(abs(valor_real - intenumcomp(fun, 0, 1, 20, "pm"))))