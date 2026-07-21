Parcial A 2018

1) Definir la Funcion posCeroNeg

posCeroNeg:: (Int,Int,Int) -> Bool
posCeroNeg (x,y,z) = (x > 0) && (y == 0) && (z < 0) 

2) 

A) Definir la Funcion tamaños

length:: [a] -> Int
length [] = 0                                   (1)
length (x:xs) = 1 + (length xs)                 (2)

tamaños:: [[a]] -> [Int]
tamaños [[]] = [0]                              (3)
tamaños [] = []                                 (4)
tamaños (xs:xxs) = (length xs) : (tamaños xxs)  (5)

B) Evaluar [[11,2],[]] en la Funcion tamaños

tamaños [[11,2],[]] = [2,0]
≡{Por Caso Recursivo (5); xs:=[11,2], xxs:= [[]]}
(length [11,2]) : (tamaños [[]]) = [2,0]
≡{Por Caso Base (3)}
(length [11,2]) : [0] = [2,0]
≡{Por Caso Recursivo (2); x:=11, xs:=[2]}
(1 + (length [2])) : [0] = [2,0]
≡{Por Caso Recursivo (2); x:=2, xs:=[]}
(1 + 1 + (length [])) : [0] = [2,0]
≡{Por Caso Base (1)}
(1 + 1 + 0) : [0] = [2,0]
≡{Por Aritmetica}
2 : [0] = [2,0]
≡{Por Constructor de Lista}
[2,0] = [2,0]
≡{Por Reflexivilidad del =}
True


3)

A) Definir la Funcion componer

componer:: String -> [String] -> [(String,String)]
componer n [] = []
componer n (x:xs) = (n,x) : (componer n xs)

B) Definit la Funcion saludar usando la Funcion componer

saludar:: [String] -> [(String,String)]
saludar [] = []
saludar (x:xs) = componer "Hola" (x:xs)


4) Demostrar #(negarLista xs) = #xs

Estructura Funciones

# :: [a] -> Int
#[] = 0                                    (1)
#(x:xs) = 1 + #xs                          (2)

negarLista:: [Bool] -> [Bool]
negarLista [] = []                         (3)
negarLista (x:xs) = (¬x) : (negarLista xs) (4)

Caso Base

#(negarLista []) = #[]
≡{Por (3)}
#[] = #[]
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = #(negarLista xs) = #xs

#(negarLista (x:xs)) = #(x:xs) 
≡{Por (4)}
#((¬x) : (negarLista xs)) = #(x:xs) 
≡{Por (2); x:=(¬x), xs:=(negarLista xs)}
1 + #(negarLista xs) = #(x:xs)
≡{Por (2)}
1 + #(negarLista xs) = 1 + #xs
≡{Por HI}
1 + #xs = 1 + #xs 
≡{Por Reflexivilidad del =}
True

Conclusion: La propiedad "#(negarLista xs) = #xs" ha sido demostrada por Induccion


5) Demostrar contarCeros(xs ++ ys) = (contarCeros xs) + (contarCeros ys)

Estructuras Funciones

(++):: [a] -> [a] -> [a]
[] ++ ys = ys                                        (1)
(x:xs) ++ ys = x : (xs ++ ys)                        (2)

contarCeros:: [Int] -> Int
contarCeros [] = 0                                   (3)
contarCeros (x:xs) | (x == 0) = 1 + (contarCeros xs) (4)
                   | (x /= 0) = contarCeros xs       (5)

Caso Base

contarCeros([] ++ ys) = (contarCeros []) + (contarCeros ys)
≡{Por (1)}
contarCeros ys = (contarCeros []) + (contarCeros ys)
≡{Por (3)}
contarCeros ys = 0 + (contarCeros ys)
≡{Por Elemento Neutro de la Suma}
contarCeros ys = contarCeros ys
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = contarCeros(xs ++ ys) = (contarCeros xs) + (contarCeros ys)

Caso (x es distinto de 0)

contarCeros((x:xs) ++ ys) = (contarCeros (x:xs)) + (contarCeros ys)
≡{Por (2)}
contarCeros(x : (xs ++ ys)) = (contarCeros (x:xs)) + (contarCeros ys)
≡{Por (5); x:=x, xs:=(xs ++ ys)}
contarCeros (xs ++ ys) = (contarCeros (x:xs)) + (contarCeros ys)
≡{Por (5)}
contarCeros (xs ++ ys) = (contarCeros xs) + (contarCeros ys)
≡{Por HI}
(contarCeros xs) + (contarCeros ys) = (contarCeros xs) + (contarCeros ys)
≡{Por Reflexivilidad del =}
True

Caso (x es igual a 0)

contarCeros((x:xs) ++ ys) = (contarCeros (x:xs)) + (contarCeros ys)
≡{Por (2)}
contarCeros(x : (xs ++ ys)) = (contarCeros (x:xs)) + (contarCeros ys)
≡{Por (4); x:=0, xs:=(xs ++ ys)}
1 + contarCeros(xs ++ ys) = (contarCeros (x:xs)) + (contarCeros ys)
≡{Por (4); x:=0, xs:=xs}
1 + contarCeros(xs ++ ys) = 1 + (contarCeros xs) + (contarCeros ys)
≡{Por HI}
1 + (contarCeros xs) + (contarCeros ys) = 1 + (contarCeros xs) + (contarCeros ys)
≡{Por Reflexivilidad del =}
True

Conclusion: La propiedad "contarCeros(xs ++ ys) = (contarCeros xs) + (contarCeros ys)" ha sido demostrada por Induccion
















