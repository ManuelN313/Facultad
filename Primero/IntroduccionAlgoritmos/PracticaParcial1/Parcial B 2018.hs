Parcial B 2018

1) Definir la Funcion esMultiplo

esMultiplo:: (Int,Int) -> Bool
esMultiplo (x,y) = ((mod x y) == 0) || ((mod y x) == 0)


2)

A) Definir la Funcion dividir

dividir:: [(Int,Int)] -> [(Int,Int)]
dividir [] = []                                            (1)
dividir ((x,y):xs) = ((div x y),(mod x y)) : (dividir xs)  (2)

B) Evaluar [(11,2),(2,11),(24,8)] en la Funcion dividir

dividir [(11,2),(2,11),(24,8)] = [(5,1),(0,2),(3,0)]
≡{Por Caso Recursivo (2); x:=11, y:=2, xs:=[(2,11),(24,8)]}
((div 11 2),(mod 11 2)) : (dividir [(2,11),(24,8)]) = [(5,1),(0,2),(3,0)]
≡{Por Caso Recursivo (2); x:=2, y:=11, xs:=[(24,8)]}
((div 11 2),(mod 11 2)) : ((div 2 11),(mod 2 11)) : (dividir [(24,8)]) = [(5,1),(0,2),(3,0)]
≡{Por Caso Recursivo (2); x:=24, y:=8, xs:=[]}
((div 11 2),(mod 11 2)) : ((div 2 11),(mod 2 11)) : ((div 24 8),(mod 24 8)) : (dividir []) = [(5,1),(0,2),(3,0)]
≡{Por Caso Base (1)}
((div 11 2),(mod 11 2)) : ((div 2 11),(mod 2 11)) : ((div 24 8),(mod 24 8)) : [] = [(5,1),(0,2),(3,0)]
≡{Por Definicion div * 3}
(5,(mod 11 2)) : (0,(mod 2 11)) : (3,(mod 24 8)) : [] = [(5,1),(0,2),(3,0)]
≡{Por Definicion mod * 3}
(5,1) : (0,2) : (3,0) : [] = [(5,1),(0,2),(3,0)]
≡{Por Constructor de Lista}
(5,1) : (0,2) : [(3,0)] = [(5,1),(0,2),(3,0)]
≡{Por Constructor de Lista}
(5,1) : [(0,2),(3,0)] = [(5,1),(0,2),(3,0)]
≡{Por Constructor de Lista}
[(5,1),(0,2),(3,0)] = [(5,1),(0,2),(3,0)]
≡{Por Reflexivilidad del =}
True


3)

A) Definir la Funcion hacerA

hacerA:: String -> String
hacerA [] = []
hacerA (x:xs) | (x == 'e') || (x == 'i') || (x == 'o') || (x == 'u') = ('a') : (hacerA xs)
              | otherwise = x : (hacerA xs)

B) Definir la Funcion palabraMacabra usando la Funcion hacerA

palabraMacabra:: String -> Bool
palabraMacabra (x:xs) = (hacerA (x:xs)) == (x:xs) 


4) Demostrar sum(invertir xs) = -(sum xs)

Estructuras Funciones

invertir:: [Int] -> [Int]
invertir [] = []                        (1)
invertir (x:xs) = (-x) : (invertir xs)  (2)

sum:: [Int] -> Int
sum [] = 0                              (3)
sum (x:xs) = x + (sum xs)               (4)

Caso Base sum(invertir xs) = -(sum xs)

sum(invertir []) = -(sum [])
≡{Por (1)}
sum [] = -(sum [])
≡{Por (3) en ambos miembros}
0 = -(0)
≡{Por Elemento Destructor de la Multiplicacion}
0 = 0
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = sum(invertir xs) = -(sum xs)

sum(invertir (x:xs)) = -(sum (x:xs))
≡{Por (2)}
sum((-x) : (invertir xs)) = -(sum (x:xs))
≡{Por (4); x:=(-x), xs:=(invertir xs)}
(-x) + sum((invertir xs)) = -(sum (x:xs))
≡{Por (4)}
(-x) + sum((invertir xs)) = -(x + (sum xs))
≡{Por Distributividad}
(-x) + sum((invertir xs)) = (-x) - (sum xs)
≡{Por HI}
(-x) - (sum xs) = (-x) - (sum xs)
≡{Por Reflexivilidad del =}
True

Conclusion: La propiedad "sum(invertir xs) = -(sum xs)" ha sido demostrada por Induccion


5) Demostrar contarCeros xs = #(filtrarCeros xs)

Estructuras Funciones

filtrarCeros:: [Int] -> [Int]
filtrarCeros [] = []                                       (1) 
filtrarCeros (x:xs) | (x == 0) = x : (filtrarCeros xs)     (2) 
                    | (x /= 0) = filtrarCeros xs           (3)

contarCeros:: [Int] -> Int
contarCeros [] = 0                                         (4) 
contarCeros (x:xs) | (x == 0) = 1 + (contarCeros xs)       (5) 
                   | (x /= 0) = contarCeros xs             (6)

# :: [a] -> Int
#[] = 0                                                    (7) 
#(x:xs) = 1 + #xs                                          (8)

Caso Base

contarCeros [] = #(filtrarCeros [])
≡{Por (4)}
0 = #(filtrarCeros [])
≡{Por (1)}
0 = #[]
≡{Por (7)}
0 = 0
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = contarCeros xs = #(filtrarCeros xs)

Caso (x es distinto de 0)

contarCeros (x:xs) = #(filtrarCeros (x:xs))
≡{Por (6)}
contarCeros xs = #(filtrarCeros (x:xs))
≡{Por (3)}
contarCeros xs = #(filtrarCeros xs)
≡{Por HI}
#(filtrarCeros xs) = #(filtrarCeros xs)
≡{Por Reflexivilidad del =}
True

Caso (x es igual a 0)

contarCeros (x:xs) = #(filtrarCeros (x:xs))
≡{Por (5)}
1 + (contarCeros xs) = #(filtrarCeros (x:xs))
≡{Por (2)}
1 + (contarCeros xs) = #(x : (filtrarCeros xs))
≡{Por (8); x:=x, xs:=(filtrarCeros xs)}
1 + (contarCeros xs) = 1 + #(filtrarCeros xs)
≡{Por HI}
1 + #(filtrarCeros xs) = 1 + #(filtrarCeros xs)
≡{Por Reflexivilidad del =}
True

Conclusion: La propiedad "contarCeros xs = #(filtrarCeros xs)" ha sido demostrada por Induccion




















































