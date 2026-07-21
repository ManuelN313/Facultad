import numpy as np
import time
from scipy import linalg
from ejercicio01a import soltrinf
from ejercicio01b import soltrsup
from ejercicio02b import soleg

a = np.array([
    [4, -1, 0, -1, 0, 0],
    [-1, 4, -1, 0, -1, 0],
    [0, -1, 4, 0, 0, -1],
    [-1, 0, 0, 4, -1, 0],
    [0, -1, 0, -1, 4, -1],
    [0, 0, -1, 0, -1, 4],
], dtype=float)

b1 = np.array([1, 1, 1, 0, 0, 0], dtype=float)
b2 = np.array([1, 1, 1, 1, 1, 1], dtype=float)

inicio1 = time.time()
x1 = soleg(a, b1)
x2 = soleg(a, b2)
fin1 = time.time()

print("La solución del sistema Ab1=x usando Eliminación Gaussiana es:\n" + str(x1))
print("La solución del sistema Ab2=x usando Eliminación Gaussiana es:\n" + str(x2))
print("El tiempo que se tardo fue " + str(fin1-inicio1) + " segundos\n")

inicio2 = time.time()
P, L, U = linalg.lu(a)
P_inversa = linalg.inv(P)
b1_prima = np.matmul(P_inversa, b1)
b2_prima = np.matmul(P_inversa, b2)
y1 = soltrinf(L, b1_prima)
k1 = soltrsup(U, y1)
y2 = soltrinf(L, b2_prima)
k2 = soltrsup(U, y2)
fin2 = time.time()

print("La solución del sistema Ab1=x usando Descomposición LU es:\n" + str(k1))
print("La solución del sistema Ab2=x usando Descomposición LU es:\n" + str(k2))
print("El tiempo que se tardo fue " + str(fin2-inicio2) + " segundos")

