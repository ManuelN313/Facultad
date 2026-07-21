--Ejercicio 3 Guia 2 (Funciones Filter) 

--A
soloPares:: [Int] -> [Int]
soloPares [] = []
soloPares (x:xs) | (mod x 2 == 0) = x : soloPares(xs)
		 | (mod x 2 /= 0) = soloPares(xs)

--B
mayores10:: [Int] -> [Int]
mayores10 [] = []
mayores10 (x:xs) | (x > 10) = x : mayores10(xs)
		 | (x < 10) = mayores10(xs)

--C
mayoresA:: Int -> [Int] -> [Int]
mayoresA a [] = []
mayoresA a (x:xs) | (x > a) = x : (mayoresA a (xs))
		  | (x < a) = mayoresA a (xs)

--ElinimaBlanco
eliminaBlanco:: String -> String -- [Char] = String
eliminaBlanco [] = []
eliminaBlanco (x:xs) | (x == ' ') = eliminaBlanco(xs)
		     | (x /= ' ') = x : (eliminaBlanco(xs)) -- Podes Usar Otherwise


--Ejercicio 4 Guia 2 (Funciones Map) 

--A
sumar1:: [Int] -> [Int]
sumar1 [] = []
sumar1 (x:xs) = (x+1):(sumar1 xs)

--B
duplica:: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = (x*2):(duplica xs)

--C
multiplica:: Int -> [Int] -> [Int]
multiplica a [] = []
multiplica a (x:xs) = (a*x):(multiplica a xs) 

--Ejercicio 5 Guia 2 (Funciones Fold)

--A
todosMenores10:: [Int] -> Bool
todosMenores10 [] = True --Valor Neutro
todosMenores10 (x:xs) | (x >= 10) = False
		      | (x < 10) = todosMenores10(xs) 

--B
hay0:: [Int] -> Bool
hay0 [] = False
hay0 (x:xs) | (x == 0) = True -- (x==0) || (hay0 xs) (Sin utlizar guardas)
	    | (x /= 0) = hay0(xs)

--C
suma:: [Int] -> Int
suma [] = 0 --Valor Neutro
suma (x:xs) = x + suma(xs)

--Ejercicio 6 Guia 2 (Funciones Zip) 

repartir:: [String] -> [String] -> [(String,String)]
repartir [] ys = []
repartir xs [] = [] -- No es Necesario poner [] [] = []
repartir (x:xs) (y:ys) = (x,y) : (repartir xs ys) --El resultado tendra la misma longitud que la del argumento mas corto

--Ejercicio 7 Guia 2 (Funciones Unzip)

apellidos:: [(String,String,Int)] -> [String]
apellidos [] = []
apellidos ((x,y,z):xs) = y : (apellidos xs)

--Ejercicio 8 Guia 2 (Operadores de Listas) 

--Length/Cardenal
largo:: [a] -> Int
largo [] = 0
largo (x:xs) = 1 + (largo xs)

--Indice (!!)
indice:: [a] -> Int -> a
indice [] n = error "Numero Fuera de Rango" 
indice (x:xs) n | (n == 0) = x
		| (n > 0) = (indice xs (n-1))
                | otherwise = error "Numero Negativo"

indicev2:: [a] -> Int -> (Maybe a)
indicev2 [] n = Nothing 
indicev2 (x:xs) n | (n == 0) = Just x
		  | (n > 0) = (indicev2 xs (n-1))
                  | otherwise = error "Numero Negativo"

indicef:: [a] -> Int -> a
indicef (x:xs) 0 = x
indicef (x:xs) n = indicef xs (n-1)

--Pegar a Izquierda
pegizq:: [a] -> a -> [a]
pegizq [] y = y:[]
pegizq (x:xs) y = x : (pegizq xs y)

--Take n xs
tomar:: [a] -> Int -> [a]
tomar [] n = []
tomar (x:xs) n | (n > 0) = x : (tomar xs (n-1))
               | otherwise = []

tomarv2:: [a] -> Int -> [a]
tomarv2 (xs) 0 = []
tomarv2 [] n = []
tomarv2 (x:xs) n = x : (tomarv2 xs (n-1))

                                                                                                                                                                                                                                                                                         
--Drop n ns
quitar:: [a] -> Int -> [a]
quitar [] n = []
quitar (x:xs) n | (n > 0) = (quitar (xs) (n-1))
                | (n == 0) = x:xs

quitarf:: [a] -> Int -> [a]
quitarf (xs) 0 = xs
quitarf [] n = []
quitarf (x:xs) n = quitarf xs (n-1)

--Concatenar (++)
unir:: [a] -> [a] -> [a]
unir [] ys = ys
unir (x:xs) ys = x : (unir (xs) (ys))
 
--Ejercicio 9 (I, III y IV) Guia 2

--A (Tipo Fold)
maximo:: [Int] -> Int
maximo [x] = x
maximo (x:xs) = max x (maximo xs)

--B (Tipo Unzip/Fold)
sumaPares:: [(Int,Int)] -> Int
sumaPares [] = 0
sumaPares ((x,y):xs) = (x+y) + sumaPares xs

--C (Tipo Fold)
todos0y1:: [Int] -> Bool
todos0y1 [] = True
todos0y1 (x:xs) = ((x == 1) || (x == 0)) && (todos0y1 xs) 

--D (Tipo Filter)
quitar0s:: [Int] -> [Int]
quitar0s [] = []
quitar0s (x:xs) | (x == 0) = quitar0s xs
                | otherwise = x : (quitar0s xs)

--E (Tipo Fold)
ultimo:: [a] -> a
ultimo [a] = a
ultimo (x:xs) = ultimo xs

--F
repetir:: Int -> Int -> [Int]
repetir 0 x = []
repetir n x = x : (repetir (n-1) x)

--G (Tipo Unzip)
concate:: [[a]] -> [a]
concate [] = []
concate (xs:xss) = xs ++ (concate xss)


--H (Tipo Map)
reversa:: [a] -> [a]
reversa [] = [] 
reversa (x:xs) = (reversa xs) ++ [x]


















  



