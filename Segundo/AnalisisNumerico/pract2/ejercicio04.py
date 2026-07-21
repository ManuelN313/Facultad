from ejercicio03 import rnewton

def fun_lab2eje4(x):
    f_x = x**3-2
    f_x_p = 3*(x**2)
    return (f_x ,f_x_p)


hx, hy = rnewton(fun_lab2eje4, 2, 1e-6, 10) #Eligo 10 como iteracion pues el metodo converge muy rapido
print("Aproximaciones a la raiz para x0=2 :") 
print(hx)
