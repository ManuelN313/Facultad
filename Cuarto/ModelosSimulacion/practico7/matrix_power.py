import numpy as np

# Definir las matrices
ej1b = np.array([[0.25, 0.5, 0.25], [0.5, 0, 0.5], [0.5, 0, 0.5]])
ej2c = np.array([[0.5, 0.25, 0.25], [1/3, 0, 2/3], [0.5, 0.5, 0]])
ej3b = np.array([[0.5, 0.5], [2/3, 1/3]])

# Calcular la potencia de la matriz
resultado1bI = np.linalg.matrix_power(ej1b, 3)
resultado1bII = np.linalg.matrix_power(ej1b, 4)
resultado2c = np.linalg.matrix_power(ej2c, 2)
resultado3b = np.linalg.matrix_power(ej3b, 3)

print("Matriz ejercicio 1bI es:")
print(resultado1bI)

print("\nMatriz ejercicio 1bII es:")
print(resultado1bII)

print("\nMatriz ejercicio 2c es:")
print(resultado2c)

print("\nMatriz ejercicio 3b es:")
print(resultado3b)