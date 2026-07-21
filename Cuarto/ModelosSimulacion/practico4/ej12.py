from random import random
import numpy as np

def p_geometrica(p1, p2, j):
    return (((1 - p1) * (1 - p2)) ** (j - 1)) * (p1 + p2 - p1 * p2)

def geometrica(p1, p2):
    U = random()
    i = 1
    F = p_geometrica(p1, p2, i)
    while (U >= F):
        i += 1
        F += p_geometrica(p1, p2, i)
    return i

def QueDevuelve(p1, p2):
    X = int(np.log(1 - random()) / np.log(1 - p1)) + 1
    Y = int(np.log(1 - random()) / np.log(1 - p2)) + 1
    return min(X, Y)

'''
aciertos = 0
for _ in range (10000):
    if (geometrica(0.05, 0.2) == 10):
        aciertos += 1
prob = aciertos/10000
print(prob)

aciertos = 0
for _ in range (10000):
    if (QueDevuelve(0.05, 0.2) == 10):
        aciertos += 1
prob = aciertos/10000
print(prob)

'''
