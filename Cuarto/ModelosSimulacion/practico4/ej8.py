from random import random
import numpy as np

# A

def generarX_trans_inver(lamda, k):
    # Calculo Sumatoria
    p = np.exp(-lamda)
    suma = p
    i = 1
    while (i <= k):
        p *= lamda / i
        suma += p
        i += 1
    # Ahora aplicamos transformada inversa
    p = np.exp(-lamda) / suma
    F = p
    U = random()
    i = 0
    while (U >= F):
        i += 1
        p *= lamda / i
        F += p
    return i

def generarX_rechazo(lamda, k): # Recomiendo ver desarrollo hecho en el cuaderno
    # Calculo Sumatoria, max(pi) y Px
    p = np.exp(-lamda)
    suma = p
    max_pi = p
    Px = [p]
    i = 1
    while (i <= k):
        p *= lamda / i
        suma += p
        max_pi = max(max_pi, p)
        Px.append(p)
        i += 1
    while (True):
        Y = int(random() * (k+1))
        U = random()
        if (U <= (Px[Y] * suma) / max_pi):
            return Y

# B
   
aciertos_t = 0
for _ in range(1000):
    if (generarX_trans_inver(0.7, 10) <= 2):
        aciertos_t += 1
proba_t = 1 - (aciertos_t / 1000)
print("N = 1000 para la Transformada Inversa X ~ P(0.7, 10), P(X > 2) =", proba_t)

aciertos_r = 0
for _ in range(1000):
    if (generarX_rechazo(0.7, 10) <= 2):
        aciertos_r += 1
proba_r = 1 - (aciertos_r / 1000)
print("N = 1000 para el Rechazo X ~ P(0.7, 10), P(X > 2) =", proba_r)

def fact(i):
    if (i == 0):
        return 1
    else:
        return i * fact(i - 1)
    
suma = 0
for i in range(10):
    suma += ((0.7 ** i) * np.exp(-0.7)) / fact(i)
proba_exac = 1 - np.exp(-0.7) * ((1 + 0.7 + 0.49/2) / suma)
print("\nValor exacto de P(X > 2) con X ~ P(0.7, 10) es", proba_exac)

# C (Ver desarrollo de porque quedo asi)

def generarXab_rechazo(lamda, k, a, b): # Con a >= 0 y b <= k
    while (True):
        Y = generarX_rechazo(lamda, k)
        if (Y >= a and Y <= b):
            return Y   

'''
aciertos = 0
for _ in range (10000):
    if (generarXab_rechazo(0.7, 10, 2, 6) == 6):
        aciertos += 1
prob = aciertos/10000

suma = 0
for i in range(2, 7):
    suma += ((0.7 ** i) * np.exp(-0.7)) / fact(i)

prob_e = ((0.7 ** 6) * np.exp(-0.7)) / (fact(6) * suma)

print(prob)
print(prob_e)

'''
