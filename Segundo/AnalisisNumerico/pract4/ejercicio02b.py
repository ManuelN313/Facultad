import numpy as np
import matplotlib.pyplot as plt

x = []
y = []

for i in range (0, 51):
    aux = (i*(4*np.pi))/50
    x.append(aux)
    y.append(np.cos(aux))

pol_0 = np.polyfit(x, y, 0)
pol_1 = np.polyfit(x, y, 1)
pol_2 = np.polyfit(x, y, 2)
pol_3 = np.polyfit(x, y, 3)
pol_4 = np.polyfit(x, y, 4)
pol_5 = np.polyfit(x, y, 5)

residuo_0 = 0
residuo_1 = 0
residuo_2 = 0
residuo_3 = 0
residuo_4 = 0
residuo_5 = 0

for i in range (0, 51):
    residuo_0 = residuo_0 + abs(y[i] - np.polyval(pol_0, x[i]))
    residuo_1 = residuo_1 + abs(y[i] - np.polyval(pol_1, x[i])) 
    residuo_2 = residuo_2 + abs(y[i] - np.polyval(pol_2, x[i])) 
    residuo_3 = residuo_3 + abs(y[i] - np.polyval(pol_3, x[i])) 
    residuo_4 = residuo_4 + abs(y[i] - np.polyval(pol_4, x[i])) 
    residuo_5 = residuo_5 + abs(y[i] - np.polyval(pol_5, x[i])) 

print("Los residuos de las aproximaciones polinomicas son")
print("Residuo Polinomio Grado 0: " + str(residuo_0))
print("Residuo Polinomio Grado 1: " + str(residuo_1))
print("Residuo Polinomio Grado 2: " + str(residuo_2))
print("Residuo Polinomio Grado 3: " + str(residuo_3))
print("Residuo Polinomio Grado 4: " + str(residuo_4))
print("Residuo Polinomio Grado 5: " + str(residuo_5))
print("Podemos observar que a medida que aumenta el grado de nuestro polinomio, se reduce el residuo")