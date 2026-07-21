from random import random
import numpy
import math

def valorPi(Nsim):
    enCirculo = 0
    for _ in range(Nsim):
        u = 2 * random() - 1
        v = 2 * random() - 1
        if u ** 2 + v ** 2 <= 1:
            enCirculo += 1
    return (4 * enCirculo)/Nsim

print("math.pi =", math.pi)
print("numpy.pi =", numpy.pi)

Nsim = [100, 1000, 10000, 100000, 1000000]
for i in range(len(Nsim)):
    j = Nsim[i]
    print("Nsim =", j, "=> Pi =", valorPi(j))