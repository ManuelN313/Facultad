from random import random

def simulacion():
    u = random()

    if (u < 0.5):
        sum = random() + random()
    else:
        sum = random() + random() + random()
    
    if (sum >= 1):
        return 1
    else:
        return 0
    
Nsim = [100, 1000, 10000, 100000, 1000000]
for i in range(len(Nsim)):
    experimentos = Nsim[i]
    aciertos = 0

    for j in range(experimentos):
        aciertos += simulacion()

    print("N =", experimentos, "=> Probabilidad =", aciertos/experimentos)
