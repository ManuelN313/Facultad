from random import random
import numpy as np
import time

def generarX_rechazo():
    while (True):
        Y = ((np.exp(1) - 1) * random()) + 1
        if (random() <= 1/Y):
            return Y

def generarX_trans():
    return np.exp(random())

Nsim = 10000
time1 = time.perf_counter()
mediaR = 0
for _ in range(Nsim):
    mediaR += generarX_rechazo()
mediaR /= Nsim
time2 = time.perf_counter()
mediaT = 0
for _ in range(Nsim):
    mediaT += generarX_trans()
mediaT /= Nsim
time3 = time.perf_counter()

print("Aproximacion Media con Metodo Rechazo es", mediaR, "con tiempo", time2 - time1)
print("Aproximacion Media con Metodo Transformada Inversa es", mediaT, "con tiempo", time3 - time2)
print("El valor exacto es", np.exp(1) - 1)

aciertosR = 0
for _ in range(Nsim):
    if (generarX_rechazo() <= 2):
        aciertosR += 1
probR = aciertosR/Nsim

aciertosT = 0
for _ in range(Nsim):
    if (generarX_trans() <= 2):
        aciertosT += 1
probT = aciertosT/Nsim

print("\nAproximacion de P(X <= 2) usando Metodo Rechazo es", probR)
print("Aproximacion de P(X <= 2) usando Metodo Trasformada Inversa es", probT)
print("El valor exacto es", np.log(2))
