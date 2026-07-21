import math
import matplotlib.pyplot as plt
import numpy as np

from ejercicio01 import intenumcomp

def senint(x):
    n = math.ceil(x / 0.1)
    if (n == 0):
        n = 1
    return intenumcomp(math.cos, 0, x, n, 'trapecio')

x = np.arange(0, 2 * np.pi, 0.5)
y = np.sin(x)
y_aprox = []

for xi in x:
    y_aprox.append(senint(xi))

plt.plot(x, y, label= "sin(x)")
plt.plot(x, y_aprox, label = "senint(x)")

plt.grid() 
plt.xlabel('Eje X')
plt.ylabel('Eje Y')
plt.title('Ejercicio 3')
plt.legend()
plt.show()