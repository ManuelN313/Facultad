Parcial 2019 

1) Definir la Funcion esCumple

esCumple:: (Int,Int,Int) -> (Int,Int,Int) -> Bool
esCumple (x,y,z) (a,b,c) = (x == a) && (y == b)


2) 

A) Definir la Funcion maximoPar

maximoPar:: [(Int,Int)] -> [Int]
maximoPar [] = []                                  (1)
maximoPar ((x,y):xs) = (max x y) : (maximoPar xs)  (2)

B) Evaluar [(3,-5),(0,1),(7,12)] en la Funcion maximoPar

maximoPar [(3,-5),(0,1),(7,12)] = [3,1,12]
≡{Por Constructor de Listas}
maximoPar (3,-5):[(0,1),(7,12)] = [3,1,12]
≡{Por Caso 2; x:=3, y:=5, xs:=[(0,1),(7,12)]}
(max 3 (-5)) : maximoPar [(0,1),(7,12)] = [3,1,12] 
≡{Por Constructor de Listas}
(max 3 (-5)) : maximoPar (0,1):[(7,12)] = [3,1,12]
≡{Por Caso 2; x:=0, y:=1, xs:=[(7,12)]}
(max 3 (-5)) : (max 0 1) : maximoPar [(7,12)] = [3,1,12]
≡{Por Constructor de Listas}
(max 3 (-5)) : (max 0 1) : maximoPar (7,12):[] = [3,1,12]
≡{Por Caso 2; x:=7 ,y:=12, xs:=[]}
(max 3 (-5)) : (max 0 1) : (max 7 12) : maximoPar [] = [3,1,12]
≡{Por Caso 1}
(max 3 (-5)) : (max 0 1) : (max 7 12) : [] = [3,1,12]
≡{Por Funcion max 3 veces}
3 : 1 : 12 : [] = [3,1,12]
≡{Por Constructor de Listas}
3 : 1 : [12] = [3,1,12]
≡{Por Constructor de Listas}
3 : [1,12] = [3,1,12]
≡{Por Constructor de Listas}
[3,1,12] = [3,1,12]
≡{Por Reflexivilidad del =}
True


3)

A) Definir la Funcion igualQue

igualQue:: Eq a => [a] -> a -> Int
igualQue [] n = 0
igualQue (x:xs) n | (x == n) = 1 + (igualQue xs n)
                  | otherwise = igualQue xs n

B) Definir la Funcion sinCeros usando la Funcion igualQue

sinCeros:: [Int] -> Bool
sinCeros (x:xs) | (igualQue (x:xs) 0) > 0 = False
                | otherwise = True


4) Demostrar #(por2 xs) = #xs

Estructura Funciones 

# :: [a] -> Int
#[] = 0                          (1)
#(x:xs) = 1 + #xs                (2)

por2:: [Int] -> [Int]
por2 [] = []                     (3)
por2 (x:xs) = (x*2) : (por2 xs)  (4)

Caso Base

#(por2 []) = #[]
≡{Por (3)}
#[] = #[]
≡{Por (1) en ambos miembros}
0 = 0
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = #(por2 xs) = #xs

#(por2 (x:xs)) = #(x:xs)
≡{Por (4)}
#((x*2) : (por2 xs)) = #(x:xs)
≡{Por (2); x:=(x*2), xs:=(por2 xs)}
1 + #(por2 xs) = #(x:xs)
≡{Por (2)}
1 + #(por2 xs) = 1 + #xs
≡{Por HI}
1 + #xs = 1 + #xs
≡{Por Reflexivilidad del =}
True

Conclusion: La propiedad "#(por2 xs) = #xs" ha sido demostrada por Induccion


5) Demostrar aprueba1 xs = aprueba2 xs

Estructuras Funciones

aprueba1:: [Int] -> [Bool]
aprueba1 [] = []                                    (1) 
aprueba1 (x:xs) | (x >= 50) = True : (aprueba1 xs)  (2)
                | (x < 50) = False : (aprueba1 xs)  (3)

aprueba2:: [Int] -> [Bool]
aprueba2 [] = []                                    (4) 
aprueba2 (x:xs) = (x >= 50) : (aprueba2 xs)         (5)

Caso Base

aprueba1 [] = aprueba2 []
≡{Por (1)}
[] = aprueba2 []
≡{Por (4)}
[] = [] 
≡{Por Reflexivilidad del =}
True  

Paso Inductivo, HI = aprueba1 xs = aprueba2 xs

Caso (x es mayor o igual a 50)

aprueba1 (x:xs) = aprueba2 (x:xs)
≡{Por (2)}
True : (aprueba1 xs) = aprueba2 (x:xs)
≡{Por (5)}
True : (aprueba1 xs) = (x >= 50) : (aprueba2 xs)
≡{Como x es mayor o igual a 50}
True : (aprueba1 xs) = True : (aprueba2 xs) 
≡{Por HI}
True : (aprueba2 xs) = True : (aprueba2 xs) 
≡{Por Reflexivilidad del =}
True

Caso (x es menor a 50)

aprueba1 (x:xs) = aprueba2 (x:xs)
≡{Por (3)}
False : (aprueba1 xs) = aprueba2 (x:xs)
≡{Por (5)}
False : (aprueba1 xs) = (x >= 50) : (aprueba2 xs)
≡{Como x es menor a 50}
False : (aprueba1 xs) = False : (aprueba2 xs)
≡{Por HI}
False : (aprueba2 xs) = False : (aprueba2 xs)
≡{Por Reflexivilidad del =}
True

Conclusion: La propiedad "aprueba1 xs = aprueba2 xs" ha sido demostrada por Induccion





































