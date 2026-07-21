--Ejercicio 1

--A
esCero :: Int -> Bool
esCero x = x == 0

--B
esPositivo :: Int -> Bool
esPositivo x = x > 0

--C
esVocal :: Char -> Bool
esVocal x = elem x "aeiouáéíúóAEIOUÁÉÍÚÓ"

--Ejercicio 2

--A
paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs

--B
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + (sumatoria xs)

--C
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * (productoria xs)

--D
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * (factorial (n-1))

--E
promedio :: [Int] -> Int
promedio [] = 0 --No es Necesario ponerlo, pero es para que no me salga Warnings
promedio (x:xs) = div (sumatoria (x:xs)) (length (x:xs))

--Ejercicio 3

pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece i (x:xs) = (i == x) || (pertenece i xs)

--Ejercicio 4

--A
paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] _ = True
paratodo' (x:xs) p = (p x) && (paratodo' xs p)

--B
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] _ = False
existe' (x:xs) p = (p x) || (existe' xs p)

--C
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] _ = 0
sumatoria' (x:xs) p = (p x) + (sumatoria' xs p)

--D
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] _ = 1
productoria' (x:xs) p = (p x) * (productoria' xs p)

--Ejercicio 5

paratodo'' :: [Bool] -> Bool
paratodo'' xs = paratodo' xs id 

--Ejercicio 6

--A
todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs even

--B
esMultiplo :: Int -> Int -> Bool
esMultiplo a b = mod a b == 0 

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (esMultiplo n)

--C
cuadrado :: Int -> Int --Tuve que definirla porque (**2) no me dejaba debido a los tipos
cuadrado x = x*x

sumaCuadrado :: Int -> Int 
sumaCuadrado x = sumatoria' [1..x] cuadrado

--D
factorial' :: Int -> Int
factorial' x = productoria' [1..x] id

--E
esPar :: Int -> Int
esPar a | even a == True = a
        | otherwise = 1

multiplicaPares :: [Int] -> Int
multiplicaPares xs = productoria' xs esPar

--Ejercicio 7

--Estas Funciones son de Alto Orden las cuales toman dos argumentos: uno de ellos una función que se la aplica al otro argumento en cuestion

--La expresión "map succ [1,-4,6,2,-8]" es equivalente a "[2,-3,7,3,-7]"

--La expresión "filter esPositivo [1,-4,6,2,-8]" es equivalente "[1,6,2]" 

--Ejercicio 8

--A
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = (x*2) : duplica xs

--B
duplica' :: [Int] -> [Int]
duplica' xs = map (*2) xs

--Ejercicio 9

--A
elementosPares :: [Int] -> [Int]
elementosPares [] = []
elementosPares (x:xs) | even x == True = x : elementosPares xs
                      | otherwise = elementosPares xs
--B
elementosPares' :: [Int] -> [Int]
elementosPares' xs = filter even xs

--C
multiplicaPares' :: [Int] -> Int
multiplicaPares' xs = productoria' (filter even xs) id --La mejora es que ahora no necesita de esPar

--Ejercicio 10

--A
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA _ [] = []
primIgualesA n (x:xs) | x == n = x : (primIgualesA n xs)
                      | otherwise = []

--B
primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' n xs = takeWhile (==n) xs

--Ejercicio 11

--A
primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x:y:xs) | x == y = x : (primIguales (y:xs))
                     | otherwise = [x]

--B
primIguales' :: Eq a => [a] -> [a]
primIguales' xs = primIgualesA (head xs) xs


--Ejercicio 12

--A) Esta mal tipado porque la tupla (a,b) no puede ser simbolizado por x ya que se pierden datos.

--B) Esta bien tipado y tanto x como y pueden ser de cualquier tipo. El patron cubre todos los casos de definicion.

--C) Esta mal tipado porque el programa deberia recibir una lista de tuplas [(a,b)], pero esta recibiendo una tupla (a,b) nada mas.

--D) Esta mal tipado por la misma razon que el A, se trata de escribir un tupla (a,b) como una variable x que provoca perdidas de datos.

--E) Esta bien tipado y x, y, a y b pueden ser de cualquier tipo. El patron solo cubre a los casos en que la lista tiene dos o más tuplas del tipo (a,b), pero no considera cuando hay un solo elemento o la lista vacia.

--F) Esta bien tipado, 0 es de tipo Int (podria ser cualquier entero, pero en la definicion obliga a que sea 0) y a puede ser cualquier tipo. El patron cubre solamente los casos particulares en los que se le de una lista con una sola tupla cuyo primer elemento deber ser 0 (a puede variar). No considera cuando hay varios tuplas, la lista vacia, o que el primer elemento sea distinto de 0.

--G) Esta mal tipado, porque a deberia ser de clase (Num a,Eq a) para que se pueda usar dicha definicion.

--H) Esta bien tipado, 1 es de tipo Int (podria ser cualquier entero, pero en la definicion obliga a que sea 1) y x puede ser cualquier tipo. El patron cubre solamente los casos en que se den una lista con una o mas tuplas cuyo primer elemento es 1 (x puede variar). No considera la lista vacia, o que el primer elemento sea distinto de 1.

--I) Esta bien tipado, a seria una funcion que toma un entero y devuelve un entero y b seria un entero. El patron cubre todos los casos posibles.

--J) Esta bien tipado, a seria una funcion que toma un entero y devuelve un entero y 3 es de tipo Int podria ser cualquier entero, pero en la definicion obliga a que sea 3). El patron cubre solamente los casos cuando ingresamos cualquier funcion que va de entero a entero y el numero 3. No considera cuando numeros distintos a 3

--K) Esta mal tipado porque la funcion pide solo dos cosas; una funcion que va de entero a entero y un entero, pero en la definicion se nos dan tres valores numericos (0 1 2) los cuales ninguno es una funcion tampoco.

--L) Esta bien tipado, a puede ser de cualquier tipo siempre y cuando sea del mismo tipo que g que es la funcion que de un tipo particular al mismo tipo particular. El patron cubre todos los casos.
 

--Ejercicio 13 (No llegue a Terminarla)

--A)
funcionA :: (a,b) -> b
funcionA (a,b) = b

--B)

--C)

--D)

--E)

--F)

--G)














 
