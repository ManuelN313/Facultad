import numpy as np
from ejercicio05a import jacobi
from ejercicio05b import gseidel

a1 = np.array([
    [3, 1, 1],
    [2, 6, 1],
    [1, 1, 4],
], dtype=float)

b1 = np.array([5, 9, 6], dtype=float)
x1 = jacobi(a1, b1, 1e-11, 100)
y1 = gseidel(a1, b1, 1e-11, 100)

print("Soluciones del Primer Sistema:")
print("La solución usando el metodo de Jacobi es " + str(x1[0]))
print("Se hicieron un total de " + str(x1[1]+1))
print("\nLa solución usando el metodo de Gauss-Seidel es " + str(y1[0]))
print("Se hicieron un total de " + str(y1[1]+1))

a2 = np.array([
    [5, 7, 6, 5],
    [7, 10, 8, 7],
    [6, 8, 10, 9],
    [5, 7, 9, 10],
], dtype=float)

b2 = np.array([23, 32, 33, 31], dtype=float)
x2 = jacobi(a2, b2, 1e-4, 100)
y2 = gseidel(a2, b2, 1e-4, 100)

print("\nSoluciones del Segundo Sistema:")
print("La solución usando el metodo de Jacobi es " + str(x2[0]))
print("Se hicieron un total de " + str(x2[1]+1))
print("\nLa solución usando el metodo de Gauss-Seidel es " + str(y2[0]))
print("Se hicieron un total de " + str(y2[1]+1))

# En el primer escenario converge a (1,1,1) mientras que el segundo no lo hace con x0 = (0,0,0,0)