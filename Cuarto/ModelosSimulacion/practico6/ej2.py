from random import random
import numpy as np

def gI(U):
    return np.exp(U) / ((2 * U) ** (1/2))

def gII(U):
    return 2 * ((1/U - 1) ** 2) * np.exp(-((1/U - 1) ** 2)) / (U ** 2) # Obs: Multiplico por 2 la funcion original 

def ejercicio2(fun, d):
    Media = fun(random())   # Genero una g(U)
    Scuad = 0
    n = 1
    while (n < 100 or (Scuad/n) ** (1/2) >= d):
        n += 1
        X = fun(random())   # Genero una g(U)
        MediaAnt = Media
        Media = MediaAnt + (X - MediaAnt) / n
        Scuad = Scuad * (1 - 1 / (n - 1)) + n * (Media - MediaAnt) ** 2
    return n, Media

respuestaI = ejercicio2(gI, 0.01)
print("El numero de datos generados para la integral I es", respuestaI[0])
print("La aproximacion de la integral I es", respuestaI[1])
print("El valor exacto de la integral I es", 2.068501936090624)     # Usando integracion Numerica

respuestaII = ejercicio2(gII, 0.01)
print("\nEl numero de datos generados para la integral II es", respuestaII[0])
print("La aproximacion de la integral II es", respuestaII[1])
print("El valor exacto de la integral II es", (np.pi / 4) ** (1/2))