import numpy as np

def intenumcomp(fun, a, b, n, regla):
    if (a > b or n <= 0):
        exit(1)

    if (regla == "trapecio"):
        h = (b-a)/n
        sum = 0
        for i in range (1, n):
            sum = sum + fun(a+i*h)
        result = (h/2)*(fun(a) + 2*sum + fun(b))

    elif (regla == "pm"): # Copiado al profe
        if ((n % 2) != 0): # n natural par
            exit(1)        
        puntos = np.linspace(a, b, n + 1)
        evals = np.array([fun(x) for x in puntos])
        h = (b - a) / n
        result = h * 2 * np.sum(evals[1::2])

    elif (regla == "simpson"):   
        h = (b-a)/(2*n)
        sum_0 = fun(a) + fun(b)
        sum_1 = 0
        sum_2 = 0
        x = a
        for i in range (1, 2*n):
            x = x + h
            if ((i % 2) == 0):
                sum_2 = sum_2 + fun(x)
            else:
                sum_1 = sum_1 + fun(x)
        
        result = (sum_0+2*sum_2+4*sum_1)*(h/3)
    else:
        exit(1)
    return result