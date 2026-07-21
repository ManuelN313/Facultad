from ejercicio01 import ilagrange
from ejercicio02 import inewton
from scipy import interpolate
import matplotlib.pyplot as plt

x = [-3, -2, -1, 0, 1, 2, 3]
y = [1, 2, 5, 10, 5, 2, 1]
z = []

for i in range (0, 201):
    z.append(-3 + 3*i/100)

w_lagrange = ilagrange(x, y, z)
w_newton = inewton(x, y, z)
w_spline = []
f_spline = interpolate.interp1d(x, y, 3)

for i in range (0, 201):
    w_spline.append(f_spline(z[i]))


def grafico(hx, hy1, hy2, hy3):
    plt.plot(hx, hy1, label='Polinomio Interpolante de Lagrange')
    plt.plot(hx, hy2, label='Polinomio Interpolante de Newton')
    plt.plot(hx, hy3, label='Polinomio Interpolante con Splines Cubicas')
    
    plt.grid() 
    plt.xlabel('Eje X')
    plt.ylabel('Eje Y')
    plt.title('Ejercicio 6')
    plt.legend();
    plt.show()
    
grafico(z, w_lagrange, w_newton, w_spline)     


#Recordemos que el polinomio de Newton y Lagrange son el mismo
#Se ve que el polinomio interpolante con splines cubicas es mucho mas estable
