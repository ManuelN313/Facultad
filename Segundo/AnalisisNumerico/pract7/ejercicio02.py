import matplotlib.pyplot as plt
import numpy as np
from scipy import optimize

f_min = np.array([-1, -1], dtype=float)
a_dec = np.array([
    [50, 24],
    [30, 33],
], dtype=float)
b_dec = np.array([2400, 2100], dtype=float)

ans = optimize.linprog(c=f_min, A_ub=a_dec, b_ub=b_dec)
sol = ans.x

print("La solución del problema es " + str(sol))

x = np.linspace(0, 50, 100)
y1 = 100-(50/24)*x
y2 = (700/11)-(10/11)*x
curva = np.minimum(y1, y2)

plt.plot(x, y1)
plt.plot(x, y2)
plt.fill_between(x, curva, alpha=0.2)
plt.plot(sol[0], sol[1], '*')
plt.xlim([0, 50])
plt.ylim([0, 50])
plt.show()