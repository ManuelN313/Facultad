# Ejercicio 1 
## A
def vonNeumann(u):
    return (u**2 // 100) % 10000

semillas = [3792, 1004, 2100, 1234]

print("\n")
for i in range (4):
    semilla = semillas[i]
    print("Semilla " + str(semilla))
    for j in range (10):
        semilla = vonNeumann(semilla)
        print(str(j+1) + ": " + str(semilla))
    print("\n")

## B
def generadorCongruencial(y):
    return (5*y + 4) % 32

y0 = [4, 50]
for i in range (2):
    y = y0[i]
    print("Y0: " + str(y))
    for j in range (10):
        y = generadorCongruencial(y)
        print(str(j+1) + ": " + str(y))
    print("\n")
    
'''
    Para ambos y0, el periodo es 8.
    Aclaracion importante: el periodo se empieza a contar desde y1
'''

## C
def generadorIII(y):
    return 5*y % 71

def generadorIV(y):
    return 7*y % 71

y = 6
for i in range (71):
    y = generadorIII(y)
    print(str(i+1) + ": " + str(y))

print("\n")
x = 4
for i in range (71):
    x = generadorIV(x)
    print(str(i+1) + ": " + str(x))
    
'''
    I) Tiene periodo maximo, explicacion en el cuaderno
    II) No tiene periodo maximo, explicacion en el cuaderno
    III) Tiene periodo 5, por lo que no es maximo
    IV) Tiene periodo 70, por lo que no es maximo (por poco)
'''