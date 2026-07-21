#Metodo de Newton
def rnewton(fun, x0, error, mit):
    x = x0 
    f_x, f_x_p = fun(x0)

    array_x = []
    array_f_x = []
    array_x.append(x)
    array_f_x.append(f_x)
    
    if abs(f_x) < error: #Veo que tan cerca esta la aproximacion de ser la raiz
        return (array_x, array_f_x)
    
    for i in range (1, mit): #Paro cuando i >= mit
        x = x - (f_x/f_x_p) #Iteracion del Metodo de Newton en donde obtengo xi
        f_x, f_x_p = fun(x) #Obtengo f(xi) y f'(xi) para utilizarlos en la proximacion iteracion
        
        array_x.append(x)
        array_f_x.append(f_x)

        if abs(f_x) < error or abs((x - array_x[i-1])/x) < error:
            #Reviso que tan cerca esta la aproximacion de ser la raiz o si mi error "relativo" es lo suficientemente pequeño
            break
        
    return (array_x, array_f_x)
