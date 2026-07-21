from random import random
from math import exp
import numpy as np

"""
Si desea que la variable aleatoria normal tenga media t y varianza o^2
(sólo considere t + o * Z, donde Z es la normal estandar)

"""

def generarNormal_rechazo(): # Genera una Normal Estandar N(0,1)
    while (True):
        Y1 = - np.log(1 - random()) # Exponencial Lambda 1
        Y2 = - np.log(1 - random()) # Exponencial Lambda 1
        Y = Y2 - (((Y1 - 1) ** 2) / 2)
        if (Y > 0):
            if (random() <= 1/2):
                return Y1
            else:
                return -Y1

def MetodoPolar(): # Genera dos Normales Estandar N(0,1)
    Rcuadrado = - 2 * np.log(1 - random())
    Theta = 2 * np.pi * random()
    X = (Rcuadrado ** (1/2)) * np.cos(Theta)
    Y = (Rcuadrado ** (1/2)) * np.sin(Theta)
    return (X, Y)

NV_MAGICCONST = 4 * exp(-0.5) / ((2.0) ** (1/2))
def normalvariate(mu, sigma): # Genera una Normal N(mu,sigma^2)
    while (True):
        U1 = random()
        U2 = 1 - random()
        Z = NV_MAGICCONST * (U1 - 0.5) / U2
        ZZ = Z * Z / 4
        if (ZZ <= -np.log(U2)):
            break
    return mu + Z * sigma

Nsim = 10000
# Para calcular la Varianza, primero estimo la Media con Nsim simulaciones y luego genero Nsim valores para la Varianza
mediaA = 0
varianzaA = 0
for _ in range(Nsim):
    mediaA += generarNormal_rechazo()
mediaA /= Nsim
for _ in range(Nsim):
    varianzaA += (generarNormal_rechazo() - mediaA) ** 2
varianzaA /= Nsim

mediaB = 0
varianzaB = 0
for _ in range(Nsim):
    X, Y = MetodoPolar()
    mediaB += X
mediaB /= Nsim
for _ in range(Nsim):
    X, Y = MetodoPolar()
    varianzaB += (X - mediaB) ** 2
varianzaB /= Nsim

""" Version mas optima, pero solo para Nsim par
mediaB = 0
varianzaB = 0
for _ in range(Nsim/2):
    X, Y = MetodoPolar(0, 1)
    mediaB += X + Y
mediaB /= Nsim
for _ in range(Nsim/2):
    X, Y = MetodoPolar(0, 1)
    varianzaB += ((X - mediaB) ** 2) + ((Y - mediaB) ** 2)
varianzaB /= Nsim
"""

mediaC = 0
varianzaC = 0
for _ in range(Nsim):
    mediaC += normalvariate(0, 1)
mediaC /= Nsim
for _ in range(Nsim):
    varianzaC += (normalvariate(0, 1) - mediaC) ** 2
varianzaC /= Nsim

print("Metodo Rechazo => Media =", mediaA, "Varianza =", varianzaA)
print("Metodo Polar => Media =", mediaB, "Varianza =", varianzaB)
print("Metodo Razon entre Uniformes => Media =", mediaC, "Varianza =", varianzaC)