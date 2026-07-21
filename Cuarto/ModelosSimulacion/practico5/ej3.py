from random import random
import numpy as np

# P arreglo con los pi, X arreglo con los generadores y arg arreglo con los argumentos 
# Observar que esta version solo sirve para VAs cuya simulacion toman un solo argumento
def metodo_composicion(P, X, args): 
    U = random()
    i = 0
    sum = P[i]
    while (U >= sum):
        i += 1
        sum += P[i]
    return X[i](args[i])

def exponencial(lamda):
    U = 1 - random()
    return -np.log(U) / lamda

def generarX():
    P = [0.5, 0.3, 0.2]
    X = [exponencial, exponencial, exponencial]
    args = [1/3, 1/5, 1/7]
    return metodo_composicion(P, X, args)

Nsim = 10000
media = 0
for _ in range(Nsim):
    media += generarX()
media /= Nsim

print(media)
