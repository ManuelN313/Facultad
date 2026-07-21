import random

def SonReciprocos(x, y):
    return (x*y) == 1.0	

for _ in range(100):
    x = 1 + random.random()
    y = 1/x	
    if not SonReciprocos(x, y):
	    print(x)
		
#Esto es porque hay casos en donde ocurre un error al aproximar y=1/x y cuando
#hacemos x*y en SonReciprocos nos va a devolver algo a cercano 1 (por derecha o izquierda)		
#y por lo tanto va a devolver false y se va a mostrar el x en cuestion por pantalla.
#En caso de que este error sea muy insignificante se va a cumplir que x*y=1.
