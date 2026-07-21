import numpy as np
from ejercicio01b import soltrsup
from ejercicio02a import egauss

def soleg(a, b):
    aux = egauss(a, b)
    u = aux[0]
    y = aux[1]

    x = soltrsup(u, y)

    return x

"""
a = np.array([
    [5, 6, 1],
    [3, 2, 6],
    [7, 8, 1],
], dtype=float)

b = np.array([1, -1, 5], dtype=float)
x = soleg(a, b)

print("La solución del sistema Ax=b es " + str(x))
"""