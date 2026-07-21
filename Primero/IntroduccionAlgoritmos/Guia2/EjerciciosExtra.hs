--Ejercicio 1 Cap 3: Recursion
copia:: [a] -> [a]
copia [] = []
copia (x:xs) = x : (copia (xs))

--Ejercicio 2 Cap 3: Recursion
inversa:: [(a,a)] -> [(a,a)]
inversa [] = []
inversa ((x,y):xs) = (y,x): (inversa (xs))

--Ejercicio 3 Cap 3: Recursion
fusion:: Ord a => [a] -> [a] -> [a]
fusion [] ys = ys
fusion (x:xs) ys = x : (fusion xs ys)


--Ejercicio 4 Cap 3: Recursion (Indice (!!))
indice:: [a] -> Int -> (Maybe a)
indice [] n = Nothing 
indice (x:xs) n | (n == 0) = Just x
		| (n > 0) = (indice xs (n-1))
                | otherwise = error "Numero Negativo"
