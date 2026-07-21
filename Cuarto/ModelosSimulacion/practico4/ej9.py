from random import random
import numpy as np
import time

# A

def geometrica_trans_inver_op(p):
    U = random()
    return int(np.log(1 - U) / np.log(1 - p)) + 1

def geometrica_trans_inver(p):
    U = random()
    i = 1
    pi = p
    F = pi
    while (U >= F):
        pi *= (1-p) 
        F += pi
        i += 1
    return i

# B

def geometrica_ensayo(p):
    ensayo = random()
    G = 1
    while (ensayo > p):
        ensayo = random()
        G += 1
    return G

time1 = time.perf_counter()
media_t_08 = 0
for _ in range(10000):
    media_t_08 += geometrica_trans_inver(0.8)
media_t_08 /= 10000
time2 = time.perf_counter()
media_to_08 = 0
for _ in range(10000):
    media_to_08 += geometrica_trans_inver_op(0.8)
media_to_08 /= 10000
time3 = time.perf_counter()
media_e_08 = 0
for _ in range(10000):
    media_e_08 += geometrica_ensayo(0.8)
media_e_08 /= 10000
time4 = time.perf_counter()
media_t_02 = 0
for _ in range(10000):
    media_t_02 += geometrica_trans_inver(0.2)
media_t_02 /= 10000
time5 = time.perf_counter()
media_to_02 = 0
for _ in range(10000):
    media_to_02 += geometrica_trans_inver_op(0.2)
media_to_02 /= 10000
time6 = time.perf_counter()
media_e_02 = 0
for _ in range(10000):
    media_e_02 += geometrica_ensayo(0.2)
media_e_02 /= 10000
time7 = time.perf_counter()

print("Con N = 10000, usando Transformada Inversa para X ~ Geom(0.8), E[X] =", media_t_08, "y se tardo", time2 - time1)
print("Con N = 10000, usando Transformada Inversa Optima para X ~ Geom(0.8), E[X] =", media_to_08, "y se tardo", time3 - time2)
print("Con N = 10000, usando Ensayo para X ~ Geom(0.8), E[X] =", media_e_08, "y se tardo", time4 - time3)
print("Valor Exacto para X ~ Geom(0.8), E[X] = 1.25\n")

print("Con N = 10000, usando Transformada Inversa para Y ~ Geom(0.2), E[Y] =", media_t_02, "y se tardo", time5 - time4)
print("Con N = 10000, usando Transformada Inversa Optima para Y ~ Geom(0.2), E[Y] =", media_to_02, "y se tardo", time6 - time5)
print("Con N = 10000, usando Ensayo para Y ~ Geom(0.2), E[Y] =", media_e_02, "y se tardo", time7 - time6)
print("Valor Exacto para Y ~ Geom(0.2), E[Y] = 5\n")