def inewton(x, y, z):
    w = []
    c = []
    
    for i in range (0, len(y)):
        c.append([y[i]])

    for j in range (1, len(x)):
        for k in range (0, len(x)-j):
            aux = (c[k+1][j-1] - c[k][j-1])/(x[k+j] - x[k])
            c[k].append(aux)

    for l in range (0, len(z)):
        pol_newton = 0
        for m in range (0, len(x)):
            newton_aux = c[0][m]
            for n in range (0, m):
                newton_aux = newton_aux*(z[l]-x[n])
            pol_newton = pol_newton + newton_aux
        w.append(pol_newton)

    return w

#print(inewton([2, 5/2, 4], [1/2, 2/5, 1/4], [0, 1, 3])) 

