from random import random
import numpy as np

def ej2c():
    u = random()
    v = random()
    if (max(u, v) > 0.6):
        return 1
    else:
        return 0
    
experimentos = 1000000
aciertos = 0
for _ in range(experimentos):
    aciertos += ej2c()
probabilidad = aciertos/experimentos
print("Probabilidad Ejercicio 2B:", probabilidad)

def MonteCarloMultiple(g, Nsim):
    Integral = 0
    for _ in range(Nsim):
        Integral += g(random(), random())
    return Integral/Nsim

def MonteCarlo(g, Nsim):
    Integral = 0
    for _ in range(Nsim):
        Integral += g(random())
    return Integral/Nsim

def ej4a(x, y):
    return 1 - np.exp(-(x+y))

def ej4b(y):
    return 1 / ((y ** 4) * np.exp((y ** (-2))))

a_1000 = MonteCarloMultiple(ej4a, 1000)
a_10000 = MonteCarloMultiple(ej4a, 10000)
a_100000 = MonteCarloMultiple(ej4a, 100000)
a_1000000 = MonteCarloMultiple(ej4a, 1000000)

b_1000 = MonteCarlo(ej4b, 1000)
b_10000 = MonteCarlo(ej4b, 10000)
b_100000 = MonteCarlo(ej4b, 100000)
b_1000000 = MonteCarlo(ej4b, 1000000)

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
