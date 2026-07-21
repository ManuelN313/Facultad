import matplotlib.pyplot as plt
import numpy as np
from scipy import optimize

f_min = np.array([10, 8], dtype=float)
a_dec = np.array([
    [-3, -2],
    [-1, -3],
    [-8, -2],
], dtype=float)
b_dec = np.array([-3, -1.5, -4], dtype=float)

ans = optimize.linprog(c=f_min, A_ub=a_dec, b_ub=b_dec)
sol = ans.x

print("Se deberia comprar " + str(sol[0]) + " del fertilizante T1 y " + str(sol[1]) + " del T2")
print("Se deberia gastar " + str(ans.fun) + " por M²")

x = np.linspace(0, 3, 100)
y1 = 1.5-1.5*x
y2 = 0.5-1/3*x
y3 = 2-4*x
curva = np.maximum(np.maximum(y1, y2), y3)

plt.plot(x, y1)
plt.plot(x, y2)
plt.plot(x, y3)
plt.fill_between(x, curva, 3, alpha=0.2)
plt.plot(sol[0], sol[1], '*')
plt.xlim([0, 3])
plt.ylim([0, 3])
plt.show()