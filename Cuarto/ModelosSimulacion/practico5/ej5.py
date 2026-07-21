from random import random
import numpy as np

def generarFM():
    X1 = - np.log(1 - random())
    X2 = - np.log(1 - random()) / 2
    X3 = - np.log(1 - random()) / 3
    return max(max(X1, X2), X3)

def generarFm():
    X1 = - np.log(1 - random())
    X2 = - np.log(1 - random()) / 2
    X3 = - np.log(1 - random()) / 3
    return min(min(X1, X2), X3)

muestra_FM = []
muestra_Fm = []
for _ in range(10):
    muestra_FM.append(generarFM())
    muestra_Fm.append(generarFm())

print("Muestra de 10 valores de FM")
print(muestra_FM)
print("Muestra de 10 valores de Fm")
print(muestra_Fm)