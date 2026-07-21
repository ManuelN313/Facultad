def ilagrange(x, y, z):
    w = []
    for i in range (0, len(z)):
        pol_lagrange = 0
        for j in range (0, len(y)):
            pol_basic_j = 1
            for k in range (0, len(x)):
                if (j != k):
                    pol_basic_j = pol_basic_j * ((z[i] - x[k])/(x[j] - x[k]))
            pol_lagrange = pol_lagrange + y[j]*pol_basic_j
        w.append(pol_lagrange)

    return w


#print(ilagrange([2, 5/2, 4], [1/2, 2/5, 1/4], [0, 1, 3])) 

