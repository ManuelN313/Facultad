import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt("./datos3a.dat")

x = []
y = []
xi = []
yi = []

for points in data:
    x.append(points[0])
    y.append(points[1])

# Buscamos una aproximacion de la forma: y = C*x^A
# Para ello vamos a pasar la expresión a una expresion lineal de la forma
# ln(y) = A*ln(x) + ln(c) <=> y' = a1*x' + a0
# Ahora debemos transformar nuestros datos
for i in range(0, len(x)):
    xi.append(np.log(x[i]))
    yi.append(np.log(y[i]))


# Voy a utilizar la formula de cuadrados minimos para calcular los coeficientes a1 y a0
# Usando esta formula voy a tener que calcular 5 sumatorias y resolver un sistema lineal 2x2
# Calculo sumatorias
a11 = len(xi)
aux = np.ones(a11)
a12 = np.dot(xi, aux)
a21 = a12
a22 = np.dot(xi, xi)
b1 = np.dot(yi, aux)
b2 = np.dot(yi, xi)


# Resuelvo Sistema Lineal
a12 = a12/a11
b1 = b1/a11

a22 = a22 - a21*a12
b2 = b2 - a21*b1

a1 = b2/a22
a0 = (b1 - a1*a12)

# Ahora obtengo A y C
a = a1
c = (np.e)**a0  
print("El valor de A es " + str(a) + " y el valor de C es " + str(c))

# Graficamos para ver los resultados
def graficar(hx, hy, a, c):
    x = np.linspace(1, 5, 250)
    plt.plot(x, (x**a)*c, label= "Aproximación" )
    plt.plot(hx, hy, label = "Datos")

    plt.grid() 
    plt.xlabel('Eje X')
    plt.ylabel('Eje Y')
    plt.title('Ejercicio 3a')
    plt.legend()
    plt.show()
    
graficar(x, y, a, c)