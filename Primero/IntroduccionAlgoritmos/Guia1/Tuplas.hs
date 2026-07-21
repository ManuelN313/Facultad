--Ejercicio 26 Guia 1 (Tuplas)

--A
segundo3:: (Int, Int, Int) -> Int
segundo3 (a, b, c) = b

--B (Tuplas con Guardas)
ordena:: (Int, Int) -> (Int, Int)
ordena (a, b) | a > b = (b, a)
              | otherwise = (a, b) 

--C (Tuplas con Guardas)
rangoPrecioParametrizado:: Int -> (Int, Int) -> String
rangoPrecioParametrizado x (a, b) | a >= b = "error en el rango!"
                                  | x < 0 = "esto no puede ser!"
                                  | x < a = "muy barato"
                                  | x > b = "demasiado caro"
                                  | otherwise = "hay que verlo bien"

--D
mayor3:: (Int, Int, Int) -> (Bool, Bool, Bool)
mayor3 (a, b, c) = ((a > 3), (b > 3), (c > 3))

--E
todosIguales:: (Int, Int, Int) -> Bool
todosIguales (a,b,c) | a == b && a == c = True
                     | otherwise = False

 
