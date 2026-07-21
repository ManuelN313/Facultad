from random import random
import math

def generadorCongruencial(y):
    return 5*y % 17

y0 = 2
print("Y0: " + str(y0))
for j in range (17):
    y0 = generadorCongruencial(y0)
    print(str(j+1) + ": " + str(y0))

def ej4a(y):
    return math.pi * math.sin(math.pi * y) + (math.pi * math.sin(3 * math.pi * y)) / 3

def ej4b(y):
    return 2 * ((1 - 1/y) ** 2) * math.exp(-((1 - 1/y) ** 2)) / (y ** 2)

def MonteCarlo(g, Nsim):
    Integral = 0
    for _ in range(Nsim):
        Integral += g(random())
    return Integral/Nsim

a_1000 = MonteCarlo(ej4a, 1000)
a_10000 = MonteCarlo(ej4a, 10000)
a_100000 = MonteCarlo(ej4a, 100000)
a_1000000 = MonteCarlo(ej4a, 1000000)

b_1000 = MonteCarlo(ej4b, 1000)
b_10000 = MonteCarlo(ej4b, 10000)
b_100000 = MonteCarlo(ej4b, 100000)
b_1000000 = MonteCarlo(ej4b, 1000000)

print("\n")
print("Ejercicio 4a")
print("N = 1000 => I = " + str(a_1000))
print("N = 10000 => I = " + str(a_10000))
print("N = 100000 => I = " + str(a_100000))
print("N = 1000000 => I = " + str(a_1000000))

print("Ejercicio 4b")
print("N = 1000 => I = " + str(b_1000))
print("N = 10000 => I = " + str(b_10000))
print("N = 100000 => I = " + str(b_100000))
print("N = 1000000 => I = " + str(b_1000000))