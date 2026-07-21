#Metodo de Biseccion
import numpy as np

def rbisec(fun, I, err, mit):
    array_mid = []
    array_fun_mid = []
    lft = I[0] #Extremo izquierdo del intervalo
    rgt = I[1] #Extremo derecho del intervalo
    fun_lft = fun(lft) #El extremo izquierdo evaluado
    fun_rgt = fun(rgt) #El extremo derecho evaluado
    dist = rgt-lft #La distancia entre los extremos o el largo del intervalo
    if np.sign(fun_lft) == np.sign(fun_rgt): #Reviso que se cumpla que F(lft)*F(rgt) < 0
        return
    for ite in range(1, mit): #Hacer hasta la iteracion mit
        dist = dist/2 #Calculo la mitad de la distancia. Cada vez que itere el ciclo la distancia se va a hacer mas chica
        mid = lft+dist#Tomo el extremo izquierdo de la correspondiente iteracion (porque puede llegar a cambiar el valor de lft)
        #y le sumo la mitad de su distancia (o 2**ite parte de la distancia original, es decir, distancia_original/2**ite)
        fun_mid = fun(mid) #Evaluo la mitad del intervalo del momento
        array_mid.append(mid)
        array_fun_mid.append(fun_mid)
        if abs(fun_mid) < err: #Veo si me siento satisfecho con mi aproximacion a la raiz
            #Aca faltaria ver si la distancia del intervalo es lo suficientemente chiquita para dejar de buscar de acuerdo
            #a una cota delta, es decir: dist < delta. No lo hacemos porque este criterio de parada solo es util para funciones
            #las cuales son muy achatadas cerca del eje x
            break
        if np.sign(fun_mid) != np.sign(fun_lft): #Veo si F(mid)*F(lft) < 0
            #Caso F(mid)*F(lft) < 0
            rgt = mid 
            fun_rgt = fun_mid
        else:
            #Caso F(mid)*F(lft) > 0
            lft = mid
            fun_lft = fun_mid 
    return (array_mid, array_fun_mid)

