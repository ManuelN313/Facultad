from random import random
import time

def generarX_rechazo(n):
    while (True):
        Y = random()
        U = random()
        if (U <= (Y ** (n-1))):
            return Y

def generarX_maximo(n):
    X = random()
    for _ in range(n-1):
        X = max(X, random())
    return X

def generarX_trans(n):
    return (random()) ** (1/n)

n = 25
Nsim = 10000
time1 = time.perf_counter()
mediaR = 0
for _ in range(Nsim):
    mediaR += generarX_rechazo(n)
mediaR /= Nsim
time2 = time.perf_counter()
mediaM = 0
for _ in range(Nsim):
    mediaM += generarX_maximo(n)
mediaM /= Nsim
time3 = time.perf_counter()
mediaT = 0
for _ in range(Nsim):
    mediaT += generarX_trans(n)
mediaT /= Nsim
time4 = time.perf_counter()

print("Aproximacion Media con Metodo Rechazo para n =", n, "es", mediaR, "con tiempo", time2 - time1)
print("Aproximacion Media con Metodo Maximo para n =", n, "es", mediaM, "con tiempo", time3 - time2)
print("Aproximacion Media con Metodo Transformada para n =", n, "es", mediaT, "con tiempo", time4 - time3)
print("El valor exacto es", n / (n+1))