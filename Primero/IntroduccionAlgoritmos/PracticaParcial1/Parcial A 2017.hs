Parcial A 2017

1) Definir la Funcion chequearSuma

chequearSuma:: (Int,Int,Int) -> Bool
chequearSuma (x,y,z) = (x+y) == z


2)

A) Definir la Funcion duplica

duplica:: [Int] -> [(Int,Int)]
duplica [] = []                      (1)
duplica (x:xs) = (x,x) : duplica xs  (2)

B) Evaluar manualmente [3,7] en la Funcion duplica

duplica [3,7] => [(3,3),(7,7)]
≡{Por Constructor de Lista}
duplica (3:[7])
≡{Por Caso 2; x:=3, xs:=[7]}
(3,3) : duplica [7]
≡{Por Constructor de Lista}
(3,3) : duplica (7:[])
≡{Por Caso 2; x:=7, xs:=[]}
(3,3) : (7,7) : duplica []
≡{Por Caso 1}
(3,3) : (7,7) : []
≡{Por Constructor de Lista}
(3,3) : [(7,7)]
≡{Por Constructor de Lista}
[(3,3),(7,7)]


3) 

A) Definir la Funcion todosIgualesA

todosIgualesA:: Int -> [Int] -> Bool
todosIgualesA n [] = True
todosIgualesA n (x:xs) = (x == n) && (todosIgualesA n xs)

B) Definir la Funcion todos0todos1 usando la Funcion todosIgualesA

todos0todos1:: [Int] -> Bool
todos0todos1 [] = True
todos0todos1 (x:xs) = (todosIgualesA 0 (x:xs)) || (todosIgualesA 1 (x:xs))


4) Demostrar drop (#xs) xs = []

Estructuras Funciones

drop:: Int -> [a] -> [a]
drop 0 xs = xs                 (1)
drop n [] = []                 (2)
drop n (x:xs) = drop (n-1) xs  (3)

# :: [a] -> Int
#[] = 0                        (4)
#(x:xs) = 1 + #xs              (5)


Caso Base

drop (#[]) [] = []
≡{Por (4)}
drop 0 [] = []
≡{Por (1); 0:=0, xs:=[]}
[] = []
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = drop (#xs) xs = []

drop (#(x:xs)) (x:xs) = []
≡{Por (5)}
drop (1 + #xs) (x:xs) = []
≡{Por (3); n:=(1 + #xs), (x:xs):=(x:xs)}
drop (1 + #xs - 1) xs = []
≡{Por Existencia del Opuesto}
drop (0 + #xs) xs = []
≡{Por Elemento Neutro de la Suma}
drop (#xs) xs = []
≡{Por HI}
[] = []
≡{Por Reflexivilidad del =}
True

Conclusion: La propiedad "drop (#xs) xs = []" ha sido demostrada por Induccion


5) Demostrar cuantos 0 (agrega0si1 xs) = (cuantos 0 xs) + (cuantos 1 xs)

Estructuras Funciones

cuantos:: Int -> [Int] -> Int
cuantos n [] = 0                                        (1)
cuantos n (x:xs) | (x == n) = 1 + (cuantos n xs)        (2) 
                 | (x /= n) = cuantos n xs              (3)

agrega0si1:: [Int] -> [Int]
agrega0si1 [] = []                                      (4)
agrega0si1 (x:xs) | (x == 1) = 0 : 1 : (agrega0si1 xs)  (5)
                  | (x /= 1) = x : (agrega0si1 xs)      (6)


Caso Base

cuantos 0 (agrega0si1 []) = (cuantos 0 []) + (cuantos 1 [])
≡{Por (4)}
cuantos 0 [] = (cuantos 0 []) + (cuantos 1 [])
≡{Por (1) en ambos miemebros; n:=0, []:=[]}
0 = 0 + (cuantos 1 [])
≡{Por (1); n:=1, []:=[]}
0 = 0 + 0
≡{Por Elemento Neutro de la Suma}
0 = 0
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = cuantos 0 (agrega0si1 xs) = (cuantos 0 xs) + (cuantos 1 xs)

Caso (x es distinto de 0 y 1)

cuantos 0 (agrega0si1 (x:xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (6)}
cuantos 0 (x : (agrega0si1 xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (3); n:=0, x:=x, xs:=(agrega0si1 xs)}
cuantos 0 (agrega0si1 xs) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (3); n:=0, x:=x, xs:=xs}
cuantos 0 (agrega0si1 xs) = (cuantos 0 xs) + (cuantos 1 (x:xs))
≡{Por (3); n:=1, x:=x, xs:=xs}
cuantos 0 (agrega0si1 xs) = (cuantos 0 xs) + (cuantos 1 xs)
≡{Por HI}
(cuantos 0 xs) + (cuantos 1 xs) = (cuantos 0 xs) + (cuantos 1 xs)
≡{Por Reflexivilidad del =}
True

Caso (x es 0)

cuantos 0 (agrega0si1 (x:xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (6); x:=0, xs:=xs}
cuantos 0 (0 : (agrega0si1 xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (2); n:=0, x:=0, xs:=(agrega0si1 xs)}
1 + (cuantos 0 (agrega0si1 xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (2); n:=0, x:0, xs:=xs}
1 + (cuantos 0 (agrega0si1 xs)) = 1 + (cuantos 0 xs) + (cuantos 1 (x:xs))
≡{Por (3); n:=1, x:=0, xs:=xs}
1 + (cuantos 0 (agrega0si1 xs)) = 1 + (cuantos 0 xs) + (cuantos 1 xs)
≡{Por HI}
1 + (cuantos 0 xs) + (cuantos 1 xs) = 1 + (cuantos 0 xs) + (cuantos 1 xs)
≡{Por Reflexivilidad del =}
True 

Caso (x es 1)

cuantos 0 (agrega0si1 (x:xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (5); x:=1, xs:=xs}
cuantos 0 (0 : 1 : (agrega0si1 xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (2); n:=0, x:=0, xs:=(1 : (agrega0si1 xs))}
1 + (cuantos 0 (1 : (agrega0si1 xs))) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (3); n:=0, x:=1, xs:=(agrega0si1 xs)}
1 + (cuantos 0 (agrega0si1 xs)) = (cuantos 0 (x:xs)) + (cuantos 1 (x:xs))
≡{Por (3); n:=0, x:=1, xs:=xs}
1 + (cuantos 0 (agrega0si1 xs)) = (cuantos 0 xs) + (cuantos 1 (x:xs))
≡{Por (2); n:=1, x:=1, xs:=xs}
1 + (cuantos 0 (agrega0si1 xs)) = (cuantos 0 xs) + 1 + (cuantos 1 xs)
≡{Por HI}
1 + (cuantos 0 xs) + (cuantos 1 xs) = (cuantos 0 xs) + 1 + (cuantos 1 xs)
≡{Por Conmutatividad de la Suma}
1 + (cuantos 0 xs) + (cuantos 1 xs) = 1 + (cuantos 0 xs) + (cuantos 1 xs)
≡{Por Reflexivilidad del =}
True


Conclusion: La propiedad "cuantos 0 (agrega0si1 xs) = (cuantos 0 xs) + (cuantos 1 xs)" ha sido demostrada por Induccion 






















