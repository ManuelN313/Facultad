Parcial A 2016

1) algunOrden:: (Int, Int, Int) -> Bool
   algunOrden (x,y,z) = ((x <= y) && (y <= z)) || ((x >= y) && (y >= z))

2)

A) absoluto:: [Int] -> [Int]
   absoluto [] = []                                (1)
   absoluto (x:xs) | (x < 0) = (-x) : absoluto xs  (2)
                   | (x >= 0) = x : absoluto xs    (3)

B) absoluto [-2,7,-9,-11] => [2,7,9,11]
    ≡{Constructor de Lista}
   absoluto ((-2):[7,-9,-11])
    ≡{Caso 2; x:=-2, xs:=[7,-9,-11]}
   (-(-2)) : absoluto [7,-9,-11]
    ≡{Constructor de Lista}
   (-(-2)) : absoluto (7:[-9,-11])
    ≡{Caso 3; x:=7, xs:=[-9,-11]}
   (-(-2)) : 7 : absoluto [-9,-11]
    ≡{Constructor de Lista}
   (-(-2)) : 7 : absoluto ((-9):[-11])
    ≡{Caso 2; x:=-9, xs:=[-11]}
   (-(-2)) : 7 : (-(-9)) : absoluto [-11]
    ≡{Constructor de Lista}
   (-(-2)) : 7 : (-(-9)) : absoluto ((-11):[])
    ≡{Caso 2; x:=-11, xs:=[]}
   (-(-2)) : 7 : (-(-9)) : (-(-11)) : absoluto []
    ≡{Caso 1}
   (-(-2)) : 7 : (-(-9)) : (-(-11)) : []
    ≡{Aritmetica}
   2 : 7 : 9 : 11 : []
    ≡{Constructor de Lista}
   2 : 7 : 9 : [11]
    ≡{Constructor de Lista}
   2 : 7 : [9,11]
    ≡{Constructor de Lista}
   2 : [7,9,11]
    ≡{Constructor de Lista}
   [2,7,9,11]

3)

A) superaNota:: Int -> [Int] -> Int
   superaNota n [] = 0
   superaNota n (x:xs) | (x >= n) = 1 + (superaNota n xs)
                       | otherwise = superaNota n xs

B) regulares:: [Int] -> Int
   regulares [] = 0
   regulares (x:xs) = (superaNota 4 (x:xs)) - (superaNota 7 (x:xs)) 


4) Demostrar #(xs ++ ys) = #xs + #ys
   
   Estructuras Formulas
   
   (++):: [a] -> [a] -> [a]
   [] ++ ys = []                (1)
   (x:xs) ++ ys = x:(xs ++ ys)  (2)

   #:: [a] -> Int
   #[] = 0                      (3)
   #(x:xs) = 1 + #xs            (4) 

   Caso Base

   #([] ++ ys) = #[] + #ys
    ≡{Por (1)}
   #ys = #[] + #ys
    ≡{Por (3)}
   #ys = 0 + #ys
    ≡{Por Elemento Neutro de la Suma}
   #ys = #ys
    ≡{Por Reflexivilidad del =}
   True

   Paso Inductivo, HI = #(xs ++ ys) = #xs + #ys
   
   #(x:xs ++ ys) = #x:xs + #ys
    ≡{Por (2)}
   #(x:(xs ++ ys)) = #x:xs + #ys
    ≡{Por (4)}
   #(x:(xs ++ ys)) = 1 + #xs + #ys
    ≡{Por (4); x:=x, xs:=(xs ++ ys)}
   1 + #(xs ++ ys) = 1 + #xs + #ys
    ≡{Por HI}
   1 + #xs + #ys = 1 + #xs + #ys
    ≡{Por Reflexivilidad del =}
   True

   Conclusion: Por Induccion queda demostrada que la propiedad "#(xs ++ ys) = #xs + #ys" es Verdadera

5) Demostrar cuantosPares xs = # (soloPares xs)

   Estructuras Funciones

   #:: [a] -> Int
   #[] = 0                                                      (1)
   #(x:xs) = 1 + #xs                                            (2) 

   cuantosPares:: [Int] -> Int
   cuantosPares [] = 0                                          (3)
   cuantosPares (x:xs) | (mod x 2 == 0) = 1 + cuantosPares xs   (4)
                       | (mod x 2 /= 0) = cuantosPares xs       (5)

   soloPares:: [Int] -> [Int]
   soloPares [] = []                                            (6)
   soloPares (x:xs) | (mod x 2 == 0) = x : soloPares xs         (7)
                    | (mod x 2 /= 0) = soloPares xs             (8)


   Caso Base

   cuantosPares [] = # (soloPares [])
    ≡{Por (3)}
   0 = # (soloPares [])
    ≡{Por (6)}
   0 = #[]
    ≡{Por (1)}
   0 = 0
    ≡{Por Reflexivilidad del =}
   True

   Paso Inductivo, HI = cuantosPares xs = # (soloPares xs)

   Caso mod x 2 == 0
   cuantosPares (x:xs) = # (soloPares (x:xs))
    ≡{Por (4)}
   1 + cuantosPares xs = # (soloPares (x:xs))
    ≡{Por (7)}
   1 + cuantosPares xs = # (x : soloPares xs)
    ≡{Por (2); x:=x, xs:=soloPares xs}
   1 + cuantosPares xs = 1 + # (soloPares xs)
    ≡{Por HI}
   1 + # (soloPares xs) = 1 + # (soloPares xs)
    ≡{Por Reflexivilidad del =}
   True

   Caso mod x 2 /= 0
   cuantosPares (x:xs) = # (soloPares (x:xs))
    ≡{Por (5)}
   cuantosPares xs = # (soloPares (x:xs))
    ≡{Por (8)}
   cuantosPares xs = # (soloPares xs)
    ≡{Por HI}
   # (soloPares xs) = # (soloPares xs)
    ≡{Por Reflexivilidad del =}
   True

   Conclusion: Por Induccion queda demostrada que la propiedad "cuantosPares xs = # (soloPares xs)" es Verdadera




 






























