import scipy
from scipy import integrate
import numpy as np

def pendulo (l, a):
    int(a)
    if (a < 0 or a > 90):
        exit(1)
    b = float(a / 180 * np.pi)
    f = lambda x: 4*((l/9.8)**(1/2))*((1-(np.sin(b/2)**2)*(np.sin(x)**2))**(-1/2))
    i = integrate.quad(f, 0, np.pi/2)

    print("La aproximación del periodo de un pendulo de longitud " + str(l) + " con amplitud " + str(a) + " es " + str(i[0]))


pendulo(10, 45)
pendulo(20, 60)
pendulo(10, 30)
pendulo(20, 90)
pendulo(15, 0) #Si alfa vale 0 vamos a tener que la integral siempre va a valer pi/2