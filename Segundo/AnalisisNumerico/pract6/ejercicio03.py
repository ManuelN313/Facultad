import numpy as np
from scipy import linalg
from ejercicio01a import soltrinf
from ejercicio01b import soltrsup

def sollu(a, b):
    P, L, U = linalg.lu(a)

    P_inversa = linalg.inv(P)
    b_prima = np.matmul(P_inversa, b)

    y = soltrinf(L, b_prima)
    x = soltrsup(U, y)

    return x

"""
a = np.array([
    [2, -2, 1],
    [1, 1, 3],
    [0, 4, 1],
], dtype=float)

b = np.array([-10, 4, 8], dtype=float)
x = sollu(a, b)

print("La solución del sistema Ax=b es " + str(x))
"""