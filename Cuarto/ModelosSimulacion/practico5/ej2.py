from random import random
import numpy as np

# Metodos para generar variables aleatorias

def generarA(a): # a > 0
    return (1/(1 - random())) ** (1/a)

def generarB(k, u): # k natural y u real > 0 
    U = 1
    for _ in range(k):
        U *= 1 - random()
    return - np.log(U) * u

def generarC(beta, lamda): # beta, lamda > 0
    return lamda * ((- np.log(1 - random())) ** (1/beta))

# Calcular Medias
Nsim = 10000

mediaA = 0
for _ in range(Nsim):
    mediaA += generarA(2)
mediaA /= Nsim

mediaB = 0
for _ in range(Nsim):
    mediaB += generarB(2, 2)
mediaB /= Nsim

mediaC = 0
for _ in range(Nsim):
    mediaC += generarC(2, 1)
mediaC /= Nsim

print("Aproximacion de la media para distribucion Pareto con a = 2:", mediaA)
print("Valor de la media para distribucion Pareto con a = 2: 2\n")
print("Aproximacion de la media para distribucion Erlang con k = 2 y u = 2:", mediaB)
print("Valorde la media para distribucion Erlang con k = 2 y u = 2: 4\n")
print("Aproximacion de la media para distribucion Weibull con beta = 2 y lamda = 1:", mediaC)
print("Valor de la media para distribucion Weibull con beta = 2 y lamda = 1:", (np.pi ** (1/2)) / 2)