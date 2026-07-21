from random import random
import time

def generarX_rechazo():
    while (True):
        Y = 2 * random() # U(0, 2)
        U = random()
        if (Y <= 1 and U <= Y): # 0 <= Y <= 1
            return Y
        if (Y >= 1 and U <= 2 - Y): # 1 <= Y <= 2
            return Y

def generarX_trans():
    U = random()
    if (U <= 1/2):
        return (2 * U) ** (1/2)
    else:
        return 2 - ((2 - 2 * U) ** (1/2))

def generarX_suma():
    return random() + random()

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
mediaS = 0
for _ in range(Nsim):
    mediaS += generarX_suma()
mediaS /= Nsim
time4 = time.perf_counter()

print("Aproximacion Media con Metodo Rechazo es", mediaR, "con tiempo", time2 - time1)
print("Aproximacion Media con Metodo Transformada Inversa es", mediaT, "con tiempo", time3 - time2)
print("Aproximacion Media con Metodo Suma Uniformes es", mediaS, "con tiempo", time4 - time3)
print("El valor exacto es 1")

aciertosR = 0
for _ in range(Nsim):
    if (generarX_rechazo() > 3/2):
        aciertosR += 1
probR = aciertosR / Nsim

aciertosT= 0
for _ in range(Nsim):
    if (generarX_trans() > 3/2):
        aciertosT += 1
probT= aciertosT / Nsim

aciertosS = 0
for _ in range(Nsim):
    if (generarX_suma() > 3/2):
        aciertosS += 1
probS = aciertosS / Nsim

print("\nAproximacion de P(X > 3/2) usando Metodo Rechazo es", probR)
print("Aproximacion de P(X > 3/2) usando Metodo Trasformada Inversa es", probT)
print("Aproximacion de P(X > 3/2) usando Metodo Suma es", probS)
print("El valor exacto es", 1/8)
