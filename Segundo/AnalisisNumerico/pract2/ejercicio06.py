from ejercicio05 import ripf

def fun_lab2ej6(x):
    return 2**(x-1)

hx = ripf(fun_lab2ej6, 2.001, 1e-5, 20)
print("Aproximaciones a la raiz de 2x = 2^x :")
print(hx)

#Tras hacer varias ejecuciones me he dado cuenta que:
#El metodo converge a x1 = 1 para el intervalo (-inf, 2)
#El metodo converge a x2 = 2 para {2}
#El metodo diverge para (2, inf)
