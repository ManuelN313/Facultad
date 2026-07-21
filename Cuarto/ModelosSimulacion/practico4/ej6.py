from random import random
import time

# A
 
def generarX_trans_inv():
    U = random()
    if (U <= 0.35):
        return 3
    elif (U <= 0.55):
        return 4
    elif (U <= 0.75):
        return 1
    elif (U <= 0.9):
        return 0
    else:
        return 2

# B

def binomial_trans_inver(n, p):
    c = p  / (1 - p)
    prob = (1 - p) ** n
    F = prob
    U = random()
    i = 0
    while (U >= F):
        prob *= c * (n - i) / (i + 1)
        F += prob
        i += 1
    return i

def generarX_rechazo():
    Px = [0.15, 0.2, 0.1, 0.35, 0.2]
    Py = [0.55 ** 4, 4 * 0.45 * (0.55 ** 3), 6 * (0.45 ** 2) * (0.55 ** 2), 4 * (0.45 ** 3) * 0.55, 0.45 ** 4]
    while (True):
        Y = binomial_trans_inver(4, 0.45)
        U = random()
        if (U <= Px[Y] / (4.88 * Py[Y])):
            return Y

# C
time1 = time.perf_counter()
for _ in range(10000):
    generarX_trans_inv()
time2 = time.perf_counter()
for _ in range(10000):
    generarX_rechazo()
time3 = time.perf_counter()

print("N = 10000 Transformada Inversa Optima para X el tiempo fue", time2 - time1)
print("N = 10000 Rechazo para X el tiempo fue", time3 - time2)