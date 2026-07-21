"""
A) 
                    Hierba A        Hierba B        Curar
Medicamento 1          3                2             25
  
Medicamento 2          4                1             20

Total Hierbas          25               10

x = unidad de m1
y = unidad de m2

Objetivo: Maximizar f(x,y) = 25x + 20y
Restricciones: 3x + 4y <= 25
               2x + y <= 10

B)
y1 <= 25/4 - (3/4)x
y2 <= 10 - 2x

C)
"""

import matplotlib.pyplot as plt
import numpy as np
from scipy import optimize

f_min = np.array([-25, -20], dtype=float)
a_dec = np.array([
    [3, 4],
    [2, 1],
], dtype=float)
b_dec = np.array([25, 10], dtype=float)

ans = optimize.linprog(c=f_min, A_ub=a_dec, b_ub=b_dec)
sol = ans.x

print("Se deberia producir " + str(sol[0]) + " unidades del medicamento 1 y " + str(sol[1]) + " unidades del medicamento 2")
print("Se curara un total de " + str(-ans.fun) + " unidades")

x = np.linspace(0, 5, 100)
y1 = (25/4) - (3/4)*x
y2 = 10 - 2*x
curva = np.minimum(y1, y2)

plt.plot(x, y1)
plt.plot(x, y2)
plt.fill_between(x, curva, 0, alpha=0.2)
plt.plot(sol[0], sol[1], '*')
plt.xlim([0, 5])
plt.ylim([0, 5])
plt.show()