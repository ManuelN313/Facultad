x = 0
while x != 10:
    x = x + 0.5
    print(x)

#Lo que va a pasar es que nuestro programa nunca va a terminar
#si la asignacion es x = x + 0.1 pues cuando lleguemos a un x cuya
#representacion en binario es periódica infinita, la maquina no va a
#poder representar el numero exactamente en binario y va a tener que
#usar una aproximacion, y esta aproximacion va a tener un error que
#jamas va a ser que x == 10. Para la asignacion x = x + 0.5,
#no va a ver problemas pues 2**-1 = 0.5
