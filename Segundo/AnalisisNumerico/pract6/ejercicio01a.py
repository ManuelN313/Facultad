import numpy as np

def soltrinf(a, b):
    n = len(b)
    x = b.copy()

    for h in range (0, n):
        if (a[h][h] == 0):
            print("Matriz es singular")
            exit(1)

    for i in range(0, n):
        sum = 0
        for j in range(0, i):
            sum = sum + a[i][j]*x[j]
        x[i] = (b[i]-sum)/a[i][i]
    
    return x

"""
a = np.array([
    [1, 0, 0],
    [2, 3, 0],
    [4, 5, 6],
], dtype=float)

b = np.array([1, 1, 1], dtype=float)
x = soltrinf(a, b)

print("La solución del sistema Ax=b es " + str(x))
"""