from random import random
import numpy as np

def poisson_trans_inv(lamda):
    p = np.exp(-lamda)
    F = p
    U = random()
    i = 0
    while (U >= F):
        i += 1
        p *= lamda / i
        F += p
    return i

def poisson_trans_inv_op(lamda):
    p = np.exp(-lamda)
    F = p
    for j in range(1, int(lamda) + 1):
        p *= lamda / j
        F += p
    U = random()
    if (U >= F):
        j = int(lamda) + 1
        while (U >= F):
            p *= lamda / j
            F += p
            j += 1
        return j - 1
    else:
        j = int(lamda)
        while (U < F):
            F -= p
            p *= j / lamda
            j -= 1
        return j + 1

aciertos = 0
for _ in range(1000):
    P = poisson_trans_inv(10)
    if (P <= 2):
        aciertos += 1
proba = 1 - (aciertos / 1000)
print("N = 1000 para la Transformada Inversa Y ~ P(10), P(Y > 2) =", proba)

aciertos_op = 0
for _ in range(1000):
    P = poisson_trans_inv_op(10)
    if (P <= 2):
        aciertos_op += 1
proba_op = 1 - (aciertos_op / 1000)
print("N = 1000 para la Transformada Inversa Mejorada Y ~ P(10), P(Y > 2) =", proba_op)

proba_exac = 1 - (np.exp(-10) * (1 + 10 + 50))
print("\nValor exacto de P(Y > 2) con Y ~ P(10) es", proba_exac)