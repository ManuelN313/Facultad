def SonOrtogonales(x, y):
    return x[0]*y[0]+x[1]*y[1] == 0.0

x = [1, 1.1024074512658109]
y = [-1, 1/x[1]]
if not SonOrtogonales(x, y):
    print("Algo salió mal...")
    print(x[1]*y[1]) #Esto nos devuelve 0.9 periódico

#Esto ocurre debido a que hay errores al aproximar 1/x[1] y esto provoca que
#cuando x[1]*y[1] nos devuelva 0.9 periódico en vez de 1 y por lo tanto no se
#la condición de que los vectores sean ortogonales
