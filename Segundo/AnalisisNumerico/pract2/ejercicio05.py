def ripf (fun, x0, err, mit):
    array_x = []
    x = x0
    array_x.append(x)
    for i in range (1, mit): #Paro cuando i >= mit
        x = fun(x) #Iteracion de Punto Fijo
        array_x.append(x) 

        if abs(x - array_x[i-1]) < err:
            #Veo si estoy sastifecho con mi aproximacion al punto fijo
            break;

    return array_x
