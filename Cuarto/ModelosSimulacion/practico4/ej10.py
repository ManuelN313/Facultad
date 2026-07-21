from random import random

# A

def p(j):
    if (j >= 1):
        return ((1/2) ** (j+1)) + (((1/2) * (2 ** (j-1))) / (3 ** j))
    else:
        return 0
    
def generarX_trans_inver():
    U = random()
    i = 1
    F = p(i)
    while (U >= F):
        i += 1
        F += p(i)
    return i

# B (En el cuaderno esta el calculo de la esperanza)

media = 0
for _ in range(1000):
    media += generarX_trans_inver()
media /= 1000

print("Aproximacion de E[X] con N = 1000 es", media)
print("Valor exacto de E[X] es", 5/2)