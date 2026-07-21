"""
                   Malta       Levadura     Precio
Cerveza Rubia        1             2           7
 
Cerveza Negra        2             1           4

Cerveza Baja         2             2           3
 
Total Materia        30            45

x = unidades Rubia
y = unidades Negra
z = unidades Baja

Objetivo: Maximizar f(x,y,z) = 7x + 4y + 3z 
Restricciones: x + 2y + 2z <= 30
               2x + y + 2z <= 45
                
"""
import numpy as np
from scipy import optimize

f_min = np.array([-7, -4, -3], dtype=float)
a_dec = np.array([
    [1, 2, 2],
    [2, 1, 2],
], dtype=float)
b_dec = np.array([30, 45], dtype=float)

ans = optimize.linprog(c=f_min, A_ub=a_dec, b_ub=b_dec)
sol = ans.x

print("Se deberia producir " + str(sol[0]) + " unidades de la Rubia")
print("Se deberia producir " + str(sol[1]) + " unidades de la Negra")
print("Se deberia producir " + str(sol[2]) + " unidades de la Baja")
print("Las ganancias seran $" + str(-ans.fun))