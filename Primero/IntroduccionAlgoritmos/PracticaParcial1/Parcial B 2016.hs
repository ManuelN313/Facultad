Parcial B 2016

1) dosIguales:: Eq a => (a,a,a) -> Bool
   dosIguales (x,y,z) = (x == y) || (x == z) || (y == z)  

2) 

A) sumaPares:: [(Int,Int)] -> [Int]
   sumaPares [] = []                            (1)
   sumaPares ((x,y):xs) = (x+y) : sumaPares xs  (2)

B) sumaPares [(3,4),(1,13),(2,2)] => [7,14,4]
    ≡{Constructor de Lista}
   sumaPares (3,4):[(1,13),(2,2)]
    ≡{Caso 2; (x,y):=(3,4), xs:=[(1,13),(2,2)]}
   (3+4) : sumaPares [(1,13),(2,2)]
    ≡{Constructor de Lista} 
   (3+4) : sumaPares (1,13):[(2,2)]
    ≡{Caso 2; (x,y):=(1,13), xs:=[(2,2)]}
   (3+4) : (1+13) : sumaPares [(2,2)]
    ≡{Constructor de Lista} 
   (3+4) : (1+13) : sumaPares (2,2):[]
    ≡{Caso 2; (x,y):=(2,2), xs:=[]}
   (3+4) : (1+13) : (2+2) : sumaPares []
    ≡{Caso 1}
   (3+4) : (1+13) : (2+2) : []
    ≡{Aritmetica}
   7 : 14 : 4 : []
    ≡{Constructor de Lista}
   7 : 14 : [4]
    ≡{Constructor de Lista}
   7 : [14,4]
    ≡{Constructor de Lista}
   [7,14,4]

3)

A) cuantos:: Int -> [Int] -> Int
   cuantos n [] = 0
   cuantos n (x:xs) | (x == n) = 1 + (cuantos n xs)
                    | (x /= n) = cuantos n xs

B) mas0que1:: [Int] -> Bool
   mas0que1 (x:xs) = (cuantos 0 (x:xs)) > (cuantos 1 (x:xs)) 


4) Demostrar #(inversa xs) = #xs

   Estructura Funciones
  
   #:: [a] -> Int
   #[] = 0                            (1)
   #(x:xs) = 1 + #xs                  (2)

   inversa:: [a] -> [a]
   inversa [] = []                    (3)
   inversa (x:xs) = (inversa xs) ◄ x  (4)   

   (◄):: [a] -> a -> [a]
   [] ◄ y = y:[]                      (5)
   (x:xs) ◄ y = x : (xs ◄ y)          (6)

   Caso Base

   #(inversa []) = #[]
    ≡{Por (3)}
   #[] = #[]
    ≡{Por (1) en ambos miembros}
   0 = 0
    ≡{Por Reflexivilidad del =}
   True

   Paso Inductivo, HI = #(inversa xs) = #xs, Propiedad= # (xs ◄ x) = 1 + #xs
   
   #(inversa (x:xs)) = #(x:xs)
    ≡{Por (2)}
   #((inversa xs) ◄ x) = #(x:xs)
    ≡{Por (4)}
   #((inversa xs) ◄ x) = 1 + #xs
    ≡{Por HI}
   #((inversa xs) ◄ x) = 1 + #(inversa xs)
    ≡{Por Propiedad; xs:=(reversa xs)}
   1 + #(inversa xs) = 1 + #(inversa xs)
    ≡{Por Reflexivilidad =}
   True

   Conclusion: Por Induccion queda demostrada que la propiedad "#(inversa xs) = #xs" es Verdadera


5) Demostrar prod (saca1 xs) = prod xs

   Estructuras Funciones 
   
   prod:: [Int] -> Int
   prod [] = 1                             (1)
   prod (x:xs) = x * prod xs               (2)

   saca1:: [Int] -> [Int]                   
   saca1 [] = []                           (3)
   saca1 (x:xs) | (x == 1) = saca1 xs      (4)
                | (x /= 1) = x : saca1 xs  (5)


   Caso Base
  
   prod (saca1 []) = prod []
    ≡{Por (3)}
   prod [] = prod []
    ≡{Por (1) en ambos}
   1 = 1
    ≡{Por Reflexivilidad =}
   True

   Paso Inductivo, HI =	prod (saca1 xs) = prod xs

   Caso x == 1

   prod (saca1 x:xs) = prod x:xs
    ≡{Por (4)}
   prod (saca1 xs) = prod x:xs
    ≡{Por (2); x:=1, xs:=xs}
   prod (saca1 xs) = 1 * prod xs
    ≡{Por Elemento Neutro de la Multiplicacion}
   prod (saca1 xs) = prod xs
    ≡{Por HI}
   prod xs = prod xs
    ≡{Por Reflexivilidad =}
   True

   Caso x /= 1

   prod (saca1 x:xs) = prod x:xs
    ≡{Por (5)}
   prod (x : saca1 xs) = prod x:xs
    ≡{Por (2); x:=x, xs:=saca1 xs}
   x * prod (saca xs) = prod x:xs
    ≡{Por (2)}
   x * prod (saca xs) = x * prod xs
    ≡{Por HI}
   x * prod xs = x * prod xs
    ≡{Por Reflexivilidad =}
   True


   Conclusion: Por Induccion queda demostrada que la propiedad "prod (saca1 xs) = prod xs" es Verdadera 

   




   

















