from random import random

def Cauchy(lamda):
    while (True):
        U1 = 1 - random()
        U2 = 1 - random()
        if (U1 ** 2 + (2 * U2 - 1) ** 2 < 1):
            return lamda * ((2 * (U2 - 1/2)) / U1)

Nsim = 10000

aciertos1 = 0
for _ in range(Nsim):
    X = Cauchy(1)
    if (-1 <= X and X <= 1):
        aciertos1 += 1
prob1 = aciertos1/Nsim

aciertos2_5 = 0
for _ in range(Nsim):
    X = Cauchy(2.5)
    if (-2.5 <= X and X <= 2.5):
        aciertos2_5 += 1
prob2_5 = aciertos2_5/Nsim

aciertos0_3 = 0
for _ in range(Nsim):
    X = Cauchy(0.3)
    if (-0.3 <= X and X <= 0.3):
        aciertos0_3 += 1
prob0_3 = aciertos0_3/Nsim

print("Probabilidad de P(-lamda <= X <= lamda) para cualquier X ~ Cauchy(lamda) es", 1/2)
print("Aproximacion Probabilidad de P(-lamda <= X <= lamda) para X ~ Cauchy(1) es", prob1)
print("Aproximacion Probabilidad de P(-lamda <= X <= lamda) para X ~ Cauchy(2.5) es", prob2_5)
print("Aproximacion Probabilidad de P(-lamda <= X <= lamda) para X ~ Cauchy(0.3) es", prob0_3)
