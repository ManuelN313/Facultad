import numpy as np

def egauss(a, b):
    n = len(b)
    a_copy = a.copy()
    b_copy = b.copy()

    for k in range(0, n-1):
        for i in range(k+1, n):
            if (a_copy[k][k] == 0):
                print("Matriz Singular")
                exit(1)

            m = a_copy[i][k]/a_copy[k][k]

            for j in range(k, n):
                a_copy[i][j] = a_copy[i][j] - m*a_copy[k][j]
            b_copy[i] = b_copy[i] - m*b_copy[k]

    return (a_copy, b_copy)

"""
a = np.array([
    [1, 2, 3],
    [5, 6, 7],
    [9, 10, 11],
], dtype=float)

b = np.array([4, 8, 12], dtype=float)
x = egauss(a, b)

print("La eliminación gaussiana de la matriz dada es:\n")
print("A = \n" + str(x[0]))
print("B = \n" + str(x[1]))
"""       