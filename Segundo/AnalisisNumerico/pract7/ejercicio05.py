# Hecho en clases

import numpy as np
from scipy import optimize

f_min = np.array([68.3, 68.3, 68.3, 68.3, 69.5, 69.5, 69.5, 69.5, 71, 71, 71, 71, 71.2, 71.2, 71.2, 71.2], dtype=float)

a_dec = np.array([
    [-1/52, 0, 0, 0, -1/57, 0, 0, 0, -1/51, 0, 0, 0, -1/56, 0, 0, 0],
    [0, -1/212, 0, 0, 0, -1/218, 0, 0, 0, -1/201, 0, 0, 0, -1/223, 0, 0],
    [0, 0, -1/25, 0, 0, 0, -1/23, 0, 0, 0, -1/26, 0, 0, 0, -1/21, 0],
    [0, 0, 0, -1/60, 0, 0, 0, -1/57, 0, 0, 0, -1/54, 0, 0, 0, -1/55],
    [1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
    ], dtype=float)

b_dec = np.array([-1, -1, -1, -1, 220, 300, 245, 190], dtype=float)

ans = optimize.linprog(c=f_min, A_ub=a_dec, b_ub=b_dec)
sol = np.round(ans.x)

print("Horas Equipo 1: " + str(sol[0]) + "  " + str(sol[1]) + "  " + str(sol[2]) + "  " + str(sol[3]))
print("Horas Equipo 2: " + str(sol[4]) + "  " + str(sol[5]) + "  " + str(sol[6]) + "  " + str(sol[7]))
print("Horas Equipo 3: " + str(sol[8]) + "  " + str(sol[9]) + "  " + str(sol[10]) + "  " + str(sol[11]))
print("Horas Equipo 4: " + str(sol[12]) + "  " + str(sol[13]) + "  " + str(sol[14]) + "  " + str(sol[15]))