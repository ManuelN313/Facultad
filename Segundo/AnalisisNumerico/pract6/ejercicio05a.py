import numpy as np
from scipy import linalg

def jacobi(a, b, err, mit):
    n = len(b)
    x = np.zeros(b.shape)

    for k in range (0, mit):

        u = []
        for i in range (0, n):
            sum1 = 0
            sum2 = 0

            for h in range (0, i):
                sum1 = sum1 + a[i][h]*x[h]
            for j in range (i+1, n):
                sum2 = sum2 + a[i][j]*x[j]

            u.append((1/a[i][i])*(b[i] - sum1 - sum2))  

        if (linalg.norm(u-x) < err):
            return (u, k)
        
        for l in range (0, n):
            x[l] = u[l]

    return (u, k)

"""
a = np.array([
    [1, 3, 2],
    [0, 1, -15],
    [0, 0, 1],
], dtype=float)

b = np.array([11, -13, 1], dtype=float)

x = jacobi(a, b, 1e-10, 15)

print("La solución del sistema Ax=b es " + str(x[0]))
print("Se hicieron un total de " + str(x[1]+1) + " iteraciones del metodo de Jacobi")
"""