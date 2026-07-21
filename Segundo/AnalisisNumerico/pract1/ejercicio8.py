import math

def mala(a, b, c):
    discriminante = math.sqrt(b*b-4*a*c)
    x_1 = (-b + discriminante)/(2*a) 
    x_2 = (-b - discriminante)/(2*a)  	
	
    return [x_1, x_2]
	
def buena(a, b, c):
    discriminante = math.sqrt(b*b-4*a*c)
    x_1 = (-b + discriminante)/(2*a) 
    x_2 = (2*c)/(-b + discriminante)
	
    return [x_1, x_2]
	
def buenaopt(a, b, c):
    discriminante = math.sqrt(b*b-4*a*c)
    if discriminante == 0:
        x_1 = -b/(2*a) 
        x_2 = x_1
    else:
        if b > 0:
            x_1 = (-b - discriminante)/(2*a) #Voy a estar sumando dos numeros negativos
        else:
            x_1 = (-b + discriminante)/(2*a) #Voy a estar sumando dos numeros positivos
        x_2 = c/(a*x_1) #Aca x_1 nunca va a ser 0 porque siempre voy a estar sumando numeros y jamas voy a obtener x_1.
                        #La unica forma de que esto ocurra seria si tanto b y discriminante fueran 0, pero si discriminante
                        #fuera 0 entraria en la guarda de discriminante == 0.0 donde se contempla esta posibilidad al asignar x_2 = x_1
    return [x_1, x_2]
	
	
a = float(input("Enter the Value of A (must not be 0): "))
b = float(input("Enter the Value of B: "))
c = float(input("Enter the Value of C: "))

#Mirar como ejemplo a=0.25 b=4.321321321 c=0.00000000001

if a == 0.0:
    print("A is equal to 0")
elif (b*b-4*a*c) < 0:
    print("Imaginary Roots")
else:
    raices_malas = mala(a, b, c)
    raices_buenas = buenaopt(a, b, c)
    print(raices_malas)
    print(raices_buenas)
    

