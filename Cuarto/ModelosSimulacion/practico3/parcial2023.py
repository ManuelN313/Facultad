from random import random
import math

def ej2c():
    u1 = random()
    v1 = random()
    if (u1 > 0.5 and v1 < 0.5):
        return 1
    elif ((u1 > 0.5 and v1 > 0.5) or (u1 < 0.5 and v1 < 0.5)):
        u2 = random()
        v2 = random()
        if (u2 > 0.5 and v2 < 0.5):
            return 1
    return 0

experimentos = 1000000
aciertos = 0
for _ in range(experimentos):
    aciertos += ej2c()
probabilidad = aciertos/experimentos
print("Probabilidad Ejercicio 2B:", probabilidad)

def ej4a(y):
    return ((6*y - 3) * 6) / (6*y - 3 - math.exp(6*y - 3))

def ej4b(y):
    return (((1/y - 2) ** 3) * math.exp(-((1/y - 2) ** 3))) / (y ** 2)

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