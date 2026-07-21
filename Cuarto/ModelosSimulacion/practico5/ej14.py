from random import random
import numpy as np

def eventosPoisson(lamda, T):
    t = 0
    NT = 0
    Eventos = []
    while (t <= T):
        U = 1 - random()
        t += - np.log(U) / lamda
        if (t <= T):
            NT += 1
            Eventos.append(t)
    return NT, Eventos

def udiscreta(m, k):
    U = random()
    return int(U * (k - m + 1)) + m

def aficionados(t):
    NT = eventosPoisson(5, t)[0]
    Y = 0
    for _ in range(NT):
        Y += udiscreta(20, 40)
    return Y

Nsim = 10000
media = 0
for _ in range(Nsim):
    media += aficionados(1)
media /= Nsim

print("Aproximadamente el promedio de aficionades en llegar para la hora 1 es", media)
print("El valor exacto es 150")
