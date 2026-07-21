import numpy as np
from ejercicio03 import rnewton

def sec(x):
    return np.cos(x)**(-1)

def fun_lab2ej8(x):
    f_x = (x*(sec(x)**2) - 2*np.tan(x))/(x**3)
    f_x_p = (2*(x**2)*(sec(x)**2)*np.tan(x) - 4*x*(sec(x)**2) + 6*np.tan(x))/(x**4)
    return (f_x, f_x_p)

hx, hy = rnewton(fun_lab2ej8, 1, 1e-5, 10)
print("Aproximaciones al minimo de tan(x)/x^2 en (0, pi/2): ")
print(hx)
