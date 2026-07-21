from random import random
import numpy as np
import time

def Poisson_no_homogeneneo_adelgazamiento(T0, T1, lamda, lamda_t):
    NT = 0
    Eventos = []
    t = T0 - np.log(1 - random()) / lamda
    while (t <= T1):
        V = random()
        if (V <= lamda_t(t) / lamda):
            NT += 1
            Eventos.append(t)
        t += - np.log(1 - random()) / lamda
    return NT, Eventos

def Poisson_adelgazamiento_mejorado(T0, T1, lamda_t, interv, lamda):
    j = 0
    t = T0 - np.log(1 - random()) / lamda[j]
    NT = 0
    Eventos = []
    while (t <= T1):
        if (t <= interv[j]):
            V = random()
            if (V <= lamda_t(t) / lamda[j]):
                NT += 1
                Eventos.append(t)
            t += - np.log(1 - random()) / lamda[j]
        else:
            t = interv[j] + (t - interv[j]) * lamda[j] / lamda[j + 1]
            j += 1
    return NT, Eventos

def lamda_t1(t):
    return 3 + 4 / (t+1)

def lamda_t2(t):
    return t ** 2 - 9 * t + 21

def lamda_t3(t):
    if (t < 2):
        return 0
    elif (t <= 3):
        return t/2 - 1
    elif (t <= 6):
        return 1 - t/6
    else:
        return 0

Nsim = 10000
# Adelgazamiento
time1 = time.perf_counter()
media1 = 0
for _ in range(Nsim):
    media1 += Poisson_no_homogeneneo_adelgazamiento(0 ,3, 7, lamda_t1)[0]
media1 /= Nsim
time2 = time.perf_counter()
media2 = 0
for _ in range(Nsim):
    media2 += Poisson_no_homogeneneo_adelgazamiento(0, 5, 21, lamda_t2)[0]
media2 /= Nsim
time3 = time.perf_counter()
media3 = 0
for _ in range(Nsim):
    media3 += Poisson_no_homogeneneo_adelgazamiento(2, 6, 1/2, lamda_t3)[0]
media3 /= Nsim
time4 = time.perf_counter()

print("Para I usando adelgazamiento, el numero promedio de eventos es aproximadamente", media1,
      "y se tardo", time2 - time1, "segs")
print("Para II usando adelgazamiento, el numero promedio de eventos es aproximadamente", media2,
      "y se tardo", time3 - time2, "segs")
print("Para III usando adelgazamiento, el numero promedio de eventos es aproximadamente", media3,
      "y se tardo", time4 - time3, "segs")

#Adelgazamiento Mejorado
time1 = time.perf_counter()
media1 = 0
for _ in range(Nsim):
    media1 += Poisson_adelgazamiento_mejorado(0, 3, lamda_t1, [1, 2, 3], [7, 5, 13/3])[0]
media1 /= Nsim
time2 = time.perf_counter()
media2 = 0
for _ in range(Nsim):
    media2 += Poisson_adelgazamiento_mejorado(0, 5, lamda_t2, [2, 4, 5], [21, 7, 1])[0]
media2 /= Nsim
time3 = time.perf_counter()
media3 = 0
for _ in range(Nsim):
    media3 += Poisson_adelgazamiento_mejorado(2, 6, lamda_t3, [5/2, 9/2, 6], [1/2, 1/2, 1/4])[0] ### No entiendo el problema
media3 /= Nsim
time4 = time.perf_counter()

print("\nPara I usando adelgazamiento mejorado, el numero promedio de eventos es aproximadamente", media1,
      "y se tardo", time2 - time1, "segs")
print("Para II usando adelgazamiento mejorado, el numero promedio de eventos es aproximadamente", media2,
      "y se tardo", time3 - time2, "segs")
print("Para III usando adelgazamiento mejorado, el numero promedio de eventos es aproximadamente", media3,
      "y se tardo", time4 - time3, "segs")

# Valores exactos
print("\nPara I, el numero promedio de eventos es exactamente", 9 + 8 * np.log(2))
print("Para II, el numero promedio de eventos es exactamente", 205/6)
print("Para III, el numero promedio de eventos es exactamente", 1)