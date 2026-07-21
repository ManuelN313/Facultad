from random import random

# A

def udiscreta(n):
	U = random()
	return int(n * U) + 1

def estan_todos(a):
    i = 0
    estan = True
    while (i < len(a) and estan):
        estan &= (a[i] == 1)
        i += 1 
    return estan

def simulacion():
    valores = [0] * 11
    N = 0
    while (not estan_todos(valores)):
        dado1 = udiscreta(6)
        dado2 = udiscreta(6)
        indice = dado1 + dado2 - 2
        valores[indice] = 1
        N += 1
    return N

# Bi

M = [100, 1000, 10000, 100000]

for i in range(len(M)):
    num_sim = M[i]
    media = 0
    desviacion1 = 0
    desviacion2 = 0
    simulaciones = []
    for j in range(num_sim):
        Nj = simulacion()
        simulaciones.append(Nj)
        media += Nj
    media /= num_sim
    # Desviacion Estandar usando Nj ya calculados
    for j in range(num_sim):
        desviacion1 += (simulaciones[j] - media) ** 2
    # Desviacion Estandar usando Nj nuevos
    for j in range(num_sim):
        desviacion2 += (simulacion() - media) ** 2
    desviacion1 = (desviacion1/num_sim) ** (1/2)
    desviacion2 = (desviacion2/num_sim) ** (1/2)

    print("N =", num_sim, "tenemos Media =", media, "Desviacion1 =", desviacion1, "Desviacion2 =", desviacion2)

# Bii

M = [100, 1000, 10000, 100000]

for i in range(len(M)):
    num_sim = M[i]
    aciertos15 = 0
    aciertos9 = 0
    for j in range(num_sim):
        Nj = simulacion()
        if (Nj >= 15):
            aciertos15 += 1
        elif (Nj <= 9):
            aciertos9 += 1
    probabilidad15 = aciertos15/num_sim
    probabilidad9 = aciertos9/num_sim
    
    print("N =", num_sim, "tenemos que P(N >= 15) =", probabilidad15, " y P(N <= 9) =", probabilidad9)