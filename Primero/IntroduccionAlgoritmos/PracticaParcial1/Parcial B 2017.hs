Parcial B 2017 

1) Definir la Funcion distancia

distancia:: (Int,Int) -> Int
distancia (x,y) | (x-y) >= 0 = (x-y)
                | otherwise = -(x-y)


2)

A) Definir la Funcion siguientes

siguientes:: [Int] -> [(Int,Int)]
siguientes [] = []                             (1)
siguientes (x:xs) = (x,x+1) : (siguientes xs)  (2) 

B) Evaluar [11,7] en la Funcion siguientes

siguientes [11,7] => [(11,12),(7,8)]
≡{Por Constructor de Lista}
siguientes (11:[7])
≡{Por Caso 2; x:=11, xs:=[7]}
(11,11+1) : (siguientes [7])
≡{Por Constructor de Lista}
(11,11+1) : (siguientes (7:[]))
≡{Por Caso 2; x:=7, xs:=[]}
(11,11+1) : (7,7+1) : (siguientes [])
≡{Por Caso 1}
(11,11+1) : (7,7+1) : []
≡{Por Aritmetica}
(11,12) : (7,8) : []
≡{Por Constructor de Lista}
(11,12) : [(7,8)]
≡{Por Constructor de Lista}
[(11,12),(7,8)]


3)

A) Definir la Funcion noAparece

noAparece:: Char -> String -> Bool
noAparece n [] = True
noAparece n (x:xs) = (x /= n) && (noAparece n xs)

B) Definir la Funcion soloConA usando la Funcion noAperece

soloConA :: String -> Bool 
soloConA (x:xs) = (noAparece 'e' (x:xs)) && (noAparece 'i' (x:xs)) && (noAparece 'o' (x:xs)) && (noAparece 'u' (x:xs))


4) Demostrar #(slutter xs) = 2 * #xs

Estructuras Funciones

# :: [a] -> Int
#[] = 0                                  (1)
#(x:xs) = 1 + #xs                        (2)

slutter:: [a] -> [a]                     
slutter [] = []                          (3)
slutter (x:xs) = x : (x : (slutter xs))  (4)

Caso Base

#(slutter []) = 2 * #[]
≡{Por (3)}
#[] = 2 * #[]
≡{Por (1) en ambos miembros}
0 = 2 * 0
≡{Por Elemento Destrutor de la Muliplicacion}
0 = 0
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = #(slutter xs) = 2 * #xs

#(slutter (x:xs)) = 2 * #(x:xs)
≡{Por (4)}
#(x : (x : (slutter xs))) = 2 * #(x:xs)
≡{Por (2); x:=x, xs:=(x : (slutter xs))}
1 + #(x : (slutter xs)) = 2 * #(x:xs)
≡{Por (2); x:=x, xs:=(slutter xs)}
1 + 1 + #(slutter xs) = 2 * #(x:xs)
≡{Por (2)}
1 + 1 + #(slutter xs) = 2 * (1 + #xs)
≡{Por HI}
1 + 1 + 2 * #xs = 2 * (1 + #xs)
≡{Por Distributividad}
1 + 1 + 2 * #xs = 2 + 2 * #xs
≡{Por Aritmetica}
2 + 2 * #xs = 2 + 2 * #xs
≡{Por Reflexivilidad del =}
True

Conclusion: La propiedad "#(slutter xs) = 2 * #xs" ha sido demostrada por Induccion


5) Demostrar cuantos 1 (agregaSiguientes xs) = (cuantos 0 xs) + (cuantos 1 xs)

Estructuras Formulas

cuantos:: Int -> [Int] -> Int
cuantos n [] = 0                                             (1) 
cuantos n (x:xs) | (x == n) = 1 + (cuantos n xs)             (2) 
                 | (x /= n) = cuantos n xs                   (3)

agregaSiguiente:: [Int] -> [Int]
agregaSiguiente [] = []                                      (4) 
agregaSiguiente (x:xs) = x : ((x+1) : (agregaSiguiente xs))  (5) 

Caso Base

cuantos 1 (agregaSiguientes []) = (cuantos 0 []) + (cuantos 1 [])
≡{Por (4)}
cuantos 1 [] = (cuantos 0 []) + (cuantos 1 [])
≡{Por (1) en ambos miembros; n:=1, xs:=[])
0 = (cuantos 0 []) + 0
≡{Por (1); n:=0, xs:=[])
0 = 0 + 0
≡{Por Elemento Neutro de la Suma}
0 = 0
≡{Por Reflexivilidad del =}
True


Paso Inductivo, HI = cuantos 1 (agregaSiguientes xs) = (cuantos 0 xs) + (cuantos 1 xs)

Caso (x es distinto de 0 y 1)

cuantos 1 (agregaSiguientes (x:xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (5)}
cuantos 1 (x : ((x+1) : (agregaSiguiente xs))) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (3); n:=1, x:=x, xs:=((x+1) : (agregaSiguiente xs))}
cuantos 1 ((x+1) : (agregaSiguiente xs))) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (3); n:=1, x:=(x+1), xs:=(agregaSiguiente xs)}
cuantos 1 (agregaSiguiente xs) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (3); n:=0, x:=x, xs:=xs}
cuantos 1 (agregaSiguiente xs) = (cuantos 0 xs) + (cuantos 1 (x:xs))
≡{Por (3); n:=1, x:=x, xs:=xs}
cuantos 1 (agregaSiguiente xs) = (cuantos 0 xs) + (cuantos 1 xs)
≡{Por HI}
(cuantos 0 xs) + (cuantos 1 xs) = (cuantos 0 xs) + (cuantos 1 xs)
≡{Por Reflexivilidad del =}
True

Caso (x es 0)

cuantos 1 (agregaSiguientes (x:xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (5); x:=0, xs:=xs}
cuantos 1 (0 : ((0+1) : (agregaSiguiente xs))) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por Aritmetica}
cuantos 1 (0 : (1 : (agregaSiguiente xs))) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (3); n:=1, x:=0, xs:=(1 : (agregaSiguiente xs))}
cuantos 1 (1 : (agregaSiguiente xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (2); n:=1, x:=1, xs:=(agregaSiguiente xs)}
1 + (cuantos 1 (agregaSiguientes xs) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (2); n:=0, x:=0, xs:=xs}
1 + (cuantos 1 (agregaSiguientes xs) = 1 + (cuantos 0 xs) + (cuantos 1 (x:xs))
≡{Por (3); n:=1, x:=0, xs:=xs}
1 + (cuantos 1 (agregaSiguientes xs) = 1 + (cuantos 0 xs) + (cuantos 1 xs)
≡{Por HI}
1 + (cuantos 0 xs) + (cuantos 1 xs) = 1 + (cuantos 0 xs) + (cuantos 1 xs)
≡{Por Reflexivilidad del =}
True

Caso (x es 1) 

cuantos 1 (agregaSiguientes (x:xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (5); x:=1, xs:=xs}
cuantos 1 (1 : ((1+1) : (agregaSiguiente xs))) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por Aritmetica}
cuantos 1 (1 : (2 : (agregaSiguiente xs))) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (2); n:=1, x:=1, xs:=(2 : (agregaSiguiente xs))}
1 + cuantos 1 (2 : (agregaSiguiente xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (3); n:=1, x:=2, xs:=(agregaSiguiente xs)}
1 + cuantos 1 (agregaSiguientes xs) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (3); n:=0, x:=1, xs:=xs}
1 + cuantos 1 (agregaSiguientes xs) = (cuantos 0 xs) + (cuantos 1 (x:xs))
≡{Por (2); n:=1, x:=1, xs:=xs}
1 + cuantos 1 (agregaSiguientes xs) = (cuantos 0 xs) + 1 + (cuantos 1 xs)
≡{Por Conmutatividad de la Suma}
1 + cuantos 1 (agregaSiguientes xs) = 1 + (cuantos 0 xs) + (cuantos 1 xs)
≡{Por Reflexivilidad del =}
True

Conclusion: La propiedad "cuantos 1 (agregaSiguientes xs) = (cuantos 0 xs) + (cuantos 1 xs)" ha sido demostrada por Induccion


































