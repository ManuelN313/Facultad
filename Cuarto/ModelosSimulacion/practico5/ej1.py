from random import random
import numpy as np

def generarA():
    U = random()
    if (U <= 1/4):
        return 2 + 2 * (U ** (1/2))
    else:
        return 6 - 6 * (((1 - U) / 3) ** (1/2))

def generarB():
    U = random()
    if (U <= 3/5):
        return - 3 + (((324 + 420 * U) ** (1/2)) / 6)
    else:
        return ((35 * U - 19) / 2) ** (1/3)

def generarC():
    U = random()
    if (U <= 1/16):
        return np.log(16 * U) / 4
    else:
        return 4 * U - (1/4)

"""
aciertos = 0
for _ in range(100000):
    if (generarC() <= 0):
        aciertos += 1
print(aciertos/100000)
"""
