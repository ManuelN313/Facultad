from random import random
import time

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

def binomial_ensayo(n, p):
    i = 0
    for _ in range(n):
        U = random()
        if (U <= p):
            i += 1
    return i

# A
time1 = time.perf_counter()
for _ in range(10000):
    binomial_trans_inver(10, 0.3)
time2 = time.perf_counter()
for _ in range(10000):
    binomial_ensayo(10, 0.3)
time3 = time.perf_counter()

print("N = 10000 para Transformada Inversa para X ~ Bin(10, 0.3) el tiempo fue", time2 - time1)
print("N = 10000 para Binomial Ensayo para X ~ Bin(10, 0.3) el tiempo fue", time3 - time2, "\n")

# B
media_t = 0
aciertos_t0 = 0
aciertos_t10 = 0
for _ in range(10000):
    B = binomial_trans_inver(10, 0.3)
    media_t += B
    if (B == 0):
        aciertos_t0 += 1
    elif (B == 10):
        aciertos_t10 += 1
media_t /= 10000
proba_t0 = aciertos_t0 / 10000
proba_t10 = aciertos_t10 / 10000
print("N = 10000 para la Transformada Inversa X ~ Bin(10, 0.3):")
print("Media =", media_t, "P(X = 0) =", proba_t0, " P(X = 10) =", proba_t10)

media_e = 0
aciertos_e0 = 0
aciertos_e10 = 0
for _ in range(10000):
    B = binomial_ensayo(10, 0.3)
    media_e += B
    if (B == 0):
        aciertos_e0 += 1
    elif (B == 10):
        aciertos_e10 += 1
media_e /= 10000
proba_e0 = aciertos_e0 / 10000
proba_e10 = aciertos_e10 / 10000
print("N = 10000 para la Binomial Ensayo X ~ Bin(10, 0.3):")
print("Media =", media_e, "P(X = 0) =", proba_e0, " P(X = 10) =", proba_e10)

# C
print("\nValores exactos para X ~ Bin(10, 0.3):")
print("Media =", 10 * 0.3, "P(X = 0) =", 0.7 ** 10, " P(X = 10) =", 0.3 ** 10)