import numpy as np
from scipy import optimize

f_min = np.loadtxt("./costos.dat")
f_min = f_min.flatten()

A1 = np.array([], dtype=float)
ones = np.ones(100)
zeros = np.zeros(100)

for i in range (0, 100):
    A1_aux = np.array([], dtype=float)
    for j in range (0, 100):
        if (j == i):
            A1_aux = np.append(A1_aux, ones)
        else:
            A1_aux = np.append(A1_aux, zeros)
    if (i == 0):
        A1 = np.append(A1, A1_aux)
    else:
        A1 = np.vstack([A1, A1_aux])

A2 = -np.tile(np.eye(100), 100)

A_dec = np.vstack([A1, A2])
A_dec.reshape((200, 100*100))

B1 = np.loadtxt("./stock.dat")
B1 = B1.flatten()

B2 = -np.loadtxt("./demanda.dat")
B2 = B2.flatten()

b_dec = np.append(B1, B2)

ans = optimize.linprog(c=f_min, A_ub=A_dec, b_ub=b_dec)
sol = np.round(ans.x)

with open("mani.txt", "w+") as result:
    print("Reparto de Mani a proveedores", file=result)
    for i in range (0, 100):
        for j in range (0, 100):
            print("Llevar " + str(sol[i*100+j]) + " desde el deposito " 
            + str(i+1) + " hasta el cliente " + str(j+1), file=result)

    print("Costo Final: " + str(ans.fun), file=result)

for i in range (0, 100):
    for j in range (0, 100):
        if (sol[i*100+j] != 0):
            print("Llevar " + str(sol[i*100+j]) + " desde el deposito " 
            + str(i+1) + " hasta el cliente " + str(j+1))

print("Costo Final: " + str(ans.fun))