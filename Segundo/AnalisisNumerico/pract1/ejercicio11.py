import math

def f(x):
    return math.sqrt(x**2+1)-1
	
def g(x):
    return (x**2)/(math.sqrt(x**2+1)+1)
	
for i in range (20):
    x = 8**-i
    print(f"f(x)={f(x)}, g(x)={g(x)}")
	
#No. las funciones devuelven valores distintos y la funcion g(x) es mejor que f(x)
