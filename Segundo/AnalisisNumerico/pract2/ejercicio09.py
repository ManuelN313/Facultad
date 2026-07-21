from ejercicio03 import rnewton

def fun_lab2ej9(x):
    f_x = 0.01328*(24**3)*(x**2)-500
    f_x_p = 0.01328*(24**3)*2*x
    return (f_x, f_x_p)

hx, hy = rnewton(fun_lab2ej9, 1, 1e-5, 10) #Como la funcion es de la forma ax^2-c (a,c > 0) puedo tomar x0 > 0
print("Aproximaciones del diametro del molino: ")
print(hx)
