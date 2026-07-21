from ejercicio02 import inewton 
import matplotlib.pyplot as plt
import numpy as np

def f(x):
    return 1/(1+25*(x**2))

def p(i, n):
    return (2*(i-1)/n)-1

def q(i, n):
    return np.cos((2*i+1)*np.pi/(2*n+2))

z = []
for i in range (0, 201):
    aux = -1 + i/100
    z.append(aux)

p_x = []
p_y = []
q_x = []
q_y = []

for i in range (0, 15):
    p_x.append([])
    p_y.append([])
    q_x.append([])
    q_y.append([])


for n in range (0, 15):
    for i in range (1, n+2):
        x_p = p(i, n+1)
        y_p = f(x_p)
        p_x[n].append(x_p)
        p_y[n].append(y_p)

for n in range (0, 15):
    for i in range (0, n+1):
        x_q = q(i, n+1)
        y_q = f(x_q)
        q_x[n].append(x_q)
        q_y[n].append(y_q)        

p_w = []
q_w = []
for n in range (0, 15):
    p_w.append(inewton(p_x[n], p_y[n], z))
    q_w.append(inewton(q_x[n], q_y[n], z))


def grafico(hx, hy1, hy2, n):
    x = np.linspace(-2, 2, 300)
    plt.plot(hx, hy1, label='Polinomio P')
    plt.plot(hx, hy2, label='Polinomio Q')
    plt.plot(x, 1/(1+25*(x**2)), label="1/(1+25*(x**2))")
    
    plt.grid() 
    plt.xlabel('Eje X')
    plt.ylabel('Eje Y')
    plt.title('Grafico con N = ' + str(n))
    plt.legend();
    plt.show()

for n in range (0, 15):
    grafico(z, p_w[n], q_w[n], n+1)
 
#Tras verlo graficamente el polinomio q es mucho mas estable que el p
