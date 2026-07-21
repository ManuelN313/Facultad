from random import random
import numpy as np

def normalEstandar(): # Genera una Normal Estandar N(0,1)
    while (True):
        Y1 = - np.log(1 - random()) # Exponencial Lambda 1
        Y2 = - np.log(1 - random()) # Exponencial Lambda 1
        Y = Y2 - (((Y1 - 1) ** 2) / 2)
        if (Y > 0):
            if (random() <= 1/2):
                return Y1
            else:
                return -Y1
            
def ejercicio1():
    Media = normalEstandar()
    Scuad = 0
    n = 1
    while (n < 100 or (Scuad/n) ** (1/2) >= 0.1):
        n += 1
        X = normalEstandar()
        MediaAnt = Media
        Media = MediaAnt + (X - MediaAnt) / n
        Scuad = Scuad * (1 - 1 / (n - 1)) + n * (Media - MediaAnt) ** 2
    return n, Media, Scuad


respuesta = ejercicio1()
print("El numero de datos generados es", respuesta[0])
print("La media muestral de los datos generados es", respuesta[1])
print("La varianza muestral de los datos generados es", respuesta[2])
print("Los valores exactos deben ser media = 0 y varianza = 1")