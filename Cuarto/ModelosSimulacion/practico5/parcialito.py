from random import random

def generarX():
    U=random()
    if U<0.22:
        return 1
    elif U<0.55:
        return 2
    elif U<0.72:
        return 3
    elif U<0.9999:
        return 4
    else:
        return 100

X = [1, 2, 3, 4, 100]
P = [0.22, 0.33, 0.17, 0.2799, 0.0001]

media = 0
for i in range(len(X)):
    media += (X[i] ** 2) * P[i]
print(media)
