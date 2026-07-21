import math
from random import random

def MonteCarlo(g, Nsim):
    Integral = 0
    for _ in range(Nsim):
        Integral += g(random())
    return Integral/Nsim

print("Ejercicio A")

def a(u): 
    return (1 - u ** 2) ** (3/2)

a_100 = MonteCarlo(a, 100)
a_1000 = MonteCarlo(a, 1000)
a_10000 = MonteCarlo(a, 10000)
a_100000 = MonteCarlo(a, 100000)
a_1000000 = MonteCarlo(a, 1000000)

print("N = 100 => I = " + str(a_100))
print("N = 1000 => I = " + str(a_1000))
print("N = 10000 => I = " + str(a_10000))
print("N = 100000 => I = " + str(a_100000))
print("N = 1000000 => I = " + str(a_1000000))

print("Ejercicio B")

def b(u):
    return (u + 2)/(u ** 2 + 4 * u + 3)

b_100 = MonteCarlo(b, 100)
b_1000 = MonteCarlo(b, 1000)
b_10000 = MonteCarlo(b, 10000)
b_100000 = MonteCarlo(b, 100000)
b_1000000 = MonteCarlo(b, 1000000)

print("N = 100 => I = " + str(b_100))
print("N = 1000 => I = " + str(b_1000))
print("N = 10000 => I = " + str(b_10000))
print("N = 100000 => I = " + str(b_100000))
print("N = 1000000 => I = " + str(b_1000000))

print("Ejercicio C")

def c(u):
    return ((1/u) - 1) * ((1 + ((1/u) - 1) ** 2 ) ** (-2)) * (1/(u ** 2))

c_100 = MonteCarlo(c, 100)
c_1000 = MonteCarlo(c, 1000)
c_10000 = MonteCarlo(c, 10000)
c_100000 = MonteCarlo(c, 100000)
c_1000000 = MonteCarlo(c, 1000000)

print("N = 100 => I = " + str(c_100))
print("N = 1000 => I = " + str(c_1000))
print("N = 10000 => I = " + str(c_10000))
print("N = 100000 => I = " + str(c_100000))
print("N = 1000000 => I = " + str(c_1000000))

print("Ejercicio D")

def d_neg(u):
    return math.exp(-((1 - (1/u)) ** 2)) / (u ** 2)

def d_pos(u):
    return math.exp(-(((1/u) - 1) ** 2)) / (u ** 2)

d_100 = MonteCarlo(d_neg, 100) + MonteCarlo(d_pos, 100)
d_1000 = MonteCarlo(d_neg, 1000) + MonteCarlo(d_pos, 1000)
d_10000 = MonteCarlo(d_neg, 10000) + MonteCarlo(d_pos, 10000)
d_100000 = MonteCarlo(d_neg, 100000) + MonteCarlo(d_pos, 100000)
d_1000000 = MonteCarlo(d_neg, 1000000) + MonteCarlo(d_pos, 1000000)

print("N = 100 => I = " + str(d_100))
print("N = 1000 => I = " + str(d_1000))
print("N = 10000 => I = " + str(d_10000))
print("N = 100000 => I = " + str(d_100000))
print("N = 1000000 => I = " + str(d_1000000))

print("Ejercicio E")

def MonteCarloMultiple(g, Nsim):
    Integral = 0
    for _ in range(Nsim):
        Integral += g(random(), random())
    return Integral/Nsim

def e(u, v):
    return math.exp((u + v) ** 2)

e_100 = MonteCarloMultiple(e, 100)
e_1000 = MonteCarloMultiple(e, 1000)
e_10000 = MonteCarloMultiple(e, 10000)
e_100000 = MonteCarloMultiple(e, 100000)
e_1000000 = MonteCarloMultiple(e, 1000000)

print("N = 100 => I = " + str(e_100))
print("N = 1000 => I = " + str(e_1000))
print("N = 10000 => I = " + str(e_10000))
print("N = 100000 => I = " + str(e_100000))
print("N = 1000000 => I = " + str(e_1000000))

print("Ejercicio F")

def MonteCarloMultipleIndicadora(g, Nsim):
    Integral = 0
    for _ in range(Nsim):
        u = random()
        v = random()
        if (u < v):
            Integral += g(u, v)
    return Integral/Nsim

def f(u, v):
    return math.exp(-(1/u + 1/v - 2)) / ((u ** 2) * (v ** 2))

f_100 = MonteCarloMultipleIndicadora(f, 100)
f_1000 = MonteCarloMultipleIndicadora(f, 1000)
f_10000 = MonteCarloMultipleIndicadora(f, 10000)
f_100000 = MonteCarloMultipleIndicadora(f, 100000)
f_1000000 = MonteCarloMultipleIndicadora(f, 1000000)

print("N = 100 => I = " + str(f_100))
print("N = 1000 => I = " + str(f_1000))
print("N = 10000 => I = " + str(f_10000))
print("N = 100000 => I = " + str(f_100000))
print("N = 1000000 => I = " + str(f_1000000))