import numpy as np

def soltrsup(a, b):
    n = len(b)
    x = b.copy()

    for h in range (0, n):
        if (a[h][h] == 0):
            print("Matriz es singular")
            exit(1)

    for i in range(n-1, -1, -1):
        sum = 0
        for j in range(i+1, n):
            sum = sum + a[i][j]*x[j]
        x[i] = (b[i]-sum)/a[i][i]
    
    return x

"""
a = np.array([
    [8, 6, 4],
    [0, 7, 3],
    [0, 0, 9],
], dtype=float)

b = np.array([7, 3, 5], dtype=float)
x = soltrsup(a, b)

print("La solución del sistema Ax=b es " + str(x))
"""