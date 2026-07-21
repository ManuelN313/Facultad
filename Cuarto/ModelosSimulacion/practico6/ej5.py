from random import random

def fact(n):
    if (n == 0):
        return 1
    else:
        return fact(n-1) * n

def p(n):
    if (n == 0):
        return 0
    else:
        return (n - 1) / fact(n)
    
def generarM():
    U = random()
    i = 0
    F = p(i)
    while (U >= F):
        i += 1
        F += p(i)
    return i

def ejercicio5(d):
    Media = generarM()
    Scuad = 0
    n = 1
    while (n < 100 or (Scuad/n) ** (1/2) >= d):
        n += 1
        X = generarM()
        MediaAnt = Media
        Media = MediaAnt + (X - MediaAnt) / n
        Scuad = Scuad * (1 - 1 / (n - 1)) + n * (Media - MediaAnt) ** 2
    return n, Media, Scuad

respuestaC = ejercicio5(0.01)
print("\nSe necesitaron N =", respuestaC[0], "valores para obtener una estimacion de e ~", respuestaC[1], "con una con desviacion menor a 0.01\n")

respuestaD = ejercicio5(5/196)
print("Se necesitaron N =", respuestaD[0], "valores para obtener una estimacion de e ~", respuestaD[1], "con un intervalo IC95 de ancho menor a 0.1\n")