import numpy as np
from scipy import linalg

def gseidel(a, b, err, mit):
    n = len(b)
    x = np.zeros(b.shape)

    for k in range (0, mit):

        u = np.zeros(b.shape)

        for i in range(0, n):
            sum1 = 0
            sum2 = 0

            for j in range (0, i):
                sum1 = sum1 + a[i][j]*u[j]
            for h in range (i+1, n):
                sum2 = sum2 + a[i][h]*x[h]

            u[i] = (1/a[i][i])*(b[i] - sum1 - sum2)

        if (linalg.norm(u-x) < err):
            return (x, k)

        for l in range (0, n):
            x[l] = u[l]

    return (x, k)

"""
a = np.array([
    [2, 1, 0],
    [1, 5, 3],
    [0, 3, 4],
], dtype=float)

b = np.array([11, -13, 1], dtype=float)

x = gseidel(a, b, 1e-10, 15)

print("La solución del sistema Ax=b es " + str(x[0]))
print("Se hicieron un total de " + str(x[1]+1) + " iteraciones del metodo de Gauss-Seidel")
"""