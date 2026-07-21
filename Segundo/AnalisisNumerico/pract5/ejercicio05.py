import scipy
from scipy import integrate
import numpy as np

f = lambda x: np.e**(-(x**2))
g = lambda x: (x**2)*np.log10(x+(((x**2)+1)**(1/2))) 

i = integrate.quad(f, -np.inf, np.inf)
j = integrate.quad(g, 0, 2)

print("El valor de la primera integral es " + str(i[0]))
print("\nEl valor de la segunda integral es " + str(j[0]))