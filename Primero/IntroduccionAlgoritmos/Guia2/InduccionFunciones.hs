--Ejercicio 11 Guia 2 

--A  Demostrar xs ++ [] = xs

Recuerdo Estructura Funcion
 
(++):: [a] -> [a] -> [a]
[] ++ ys = ys (1)
(x:xs) ++ ys = x : (xs ++ ys) (2)

Caso Base

[] ++ [] = []
={Por (1); xs=[], ys=[]}
[] = []
={Por Reflexivilidad del =}
True

Paso Inductivo, HI = xs ++ [] = xs

(x:xs) ++ [] = x:xs
={Por (2); x=x, xs=xs, ys=[]}
x : (xs ++ []) = x:xs
={Por HI}
x:xs = x:xs
={Por Reflexivilidad del =}
True

Conclusion: La propiedad "xs ++ [] = xs" ha sido demostrada por Induccion


--B  Demostrar #xs >= 0

Recuerdo Estructura Funcion

#:: [a] -> Int
#[] = 0 (1)
#(x:xs) = 1 + (#xs) (2)

Caso Base

#[] >= 0
={Por (1)}
0 >= 0
={Por reflexivilidad del >=}
True

Paso Inductivo, HI = #xs >= 0

#(x:xs) >= 1
={Por (2)}
1 + (#xs) >= 1
={Por HI}
1 + 0 >= 1
={Elemento Neutro de la Suma}
1 >= 1
={Por reflexivilidad del >=}
True

Conclusion: La propiedad "#xs >= 0" ha sido demostrada por Induccion


--Ejercicio 12 Guia 2

-- Demostrar sum(quitar0s xs) = sum xs

Recuerdo Estructuras Funciones

quitar0s:: [Int] -> [Int]
quitar0s [] = []  (1)
quitar0s (x:xs) | (x == 0) = quitar0s xs   (2)
                | (x /= 0) = x : (quitar0s xs)  (3)

sum:: [Int] -> Int
sum [] = 0  (4)
sum (x:xs) = x + sum xs (5)

Caso Base

sum(quitar0s []) = sum []
={Por (1)}
sum [] = sum []
={Por (4) en ambos lados de la igualdad}
0 = 0
={Por Reflexivilidad del =}
True

Paso Inductivo, HI = sum(quitar0s xs) = sum xs

Caso x == 0

sum(quitar0s x:xs) = sum x:xs
={Por (2)}
sum(quitar0s xs) = sum x:xs
={Por (5)}
sum(quitar0s xs) = x + sum xs
={Por HI}
sum xs = x + sum xs
={Como x = 0, por Elemento Neutro de la Suma}
sum xs = sum xs
={Por Reflexivilidad del =}
True

Caso x /= 0

sum(quitar0s x:xs) = sum x:xs
={Por (3)}
sum(x : (quitar0s xs)) = sum x:xs
={Por (5) en ambos miembros de la igualdad}
x + sum(quitar0s xs) = x + sum xs
={Por HI}
x + sum xs = x + sum xs
={Por Reflexivilidad del =}
True

Conclusion: En ambos casos la propiedad "sum(quitar0s xs) = sum xs" queda demostrada por Induccion


--Ejercicio 13 Guia 2

--Demostrar soloPares(xs ++ ys) = (soloPares xs) ++ (soloPares ys)

Recuerdo Estructura Funciones

(++):: [a] -> [a] -> [a]
[] ++ ys = ys (1)
(x:xs) ++ ys = x : (xs ++ ys) (2)

soloPares:: [Int] -> [Int]
soloPares [] = [] (3)
soloPares (x:xs) | (mod x 2 == 0) = x : soloPares(xs) (4)
		 | (mod x 2 /= 0) = soloPares(xs)     (5)


Caso Base

soloPares([] ++ ys) = (soloPares []) ++ (soloPares ys)
={Por (1)}
soloPares ys = (soloPares []) ++ (soloPares ys)
={Por (3)}
soloPares ys = [] ++ (soloPares ys)
={Por (1); []=[], ys=(soloPares ys)}
soloPares ys = soloPares ys
={Por Reflexivilidad del =}
True

Paso Inductivo, HI = soloPares(xs ++ ys) = (soloPares xs) ++ (soloPares ys)

Caso x es Par

soloPares(x:xs ++ ys) = (soloPares x:xs) ++ (soloPares ys)
={Por (2)}
soloPares(x : (xs ++ ys)) = (soloPares x:xs) ++ (soloPares ys)
={Por (4); x=x, xs=xs ++ ys}
x : soloPares(xs ++ ys) = (soloPares x:xs) ++ (soloPares ys)
={Por (4); x=x, xs=xs}
x : soloPares(xs ++ ys) = x : (soloPares xs) ++ (soloPares ys)
={Por HI}
x : (soloPares xs) ++ (soloPares ys) = x : (soloPares xs) ++ (soloPares ys)
={Por Reflexivilidad del =}
True


Caso x es Impar

soloPares(x:xs ++ ys) = (soloPares x:xs) ++ (soloPares ys)
={Por (2)}
soloPares(x : (xs ++ ys)) = (soloPares x:xs) ++ (soloPares ys)
={Por (5); x=x; xs=xs ++ ys}
soloPares(xs ++ ys) = (soloPares x:xs) ++ (soloPares ys)
={Por (5); x=x; xs=xs}
soloPares(xs ++ ys) = (soloPares xs) ++ (soloPares ys)
={Por HI}
(soloPares xs) ++ (soloPares ys) = (soloPares xs) ++ (soloPares ys)
={Por Reflexivilidad del =}
True


Conclusion: En ambos casos la propiedad "soloPares(xs ++ ys) = (soloPares xs) ++ (soloPares ys)" queda demostrada por Induccion


--Ejercicio 14 Guia 2

--Demostrar sum(xs ++ ys) = sum xs + sum ys

Recuerdo Estructuras Funciones

(++):: [a] -> [a] -> [a]
[] ++ ys = ys (1)
(x:xs) ++ ys = x : (xs ++ ys) (2)

sum:: [Int] -> Int
sum [] = 0  (3)
sum (x:xs) = x + sum xs (4)

Caso Base

sum([] ++ ys) = sum [] + sum ys
={Por (1)}
sum ys = sum [] + sum ys
={Por (3)}
sum ys = 0 + sum ys
={Elemento Neutro de la Suma}
sum ys = sum ys
={Por Reflexivilidad del =}
True

Paso Inductivo, HI = sum(xs ++ ys) = sum xs + sum ys

sum(x:xs ++ ys) = sum x:xs + sum ys
={Por (2)}
sum(x : (xs ++ ys)) = sum x:xs + sum ys
={Por (4); x=x; xs=xs ++ ys}
x + sum(xs ++ ys) = sum x:xs + sum ys
={Por (4); x=x; xs=xs}
x + sum(xs ++ ys) = x + sum xs + sum ys
={Por HI}
x + sum xs + sum ys = x + sum xs + sum ys 
={Por Reflexivilidad del =}
True


Conclusion: La propiedad "sum(xs ++ ys) = sum xs + sum ys" ha sido demostrada por Induccion


--Ejercicio 15 Guia 2

--Demostrar #(repetir n x) = n

Recuerdo Estructura Funcion

repetir:: Int -> Int -> [Int]
repetir 0 x = []  (1)
repetir n x = x : (repetir (n-1) x)  (2)

#:: [a] -> Int
#[] = 0 (3)
#(x:xs) = 1 + (#xs) (4)

Caso Base

#(repetir 0 x) = 0
={Por (1)}
#[] = 0
={Por (3)}
0 = 0
={Por Reflexivilidad del =}
True

Paso Inductivo, HI = #(repetir n x) = n

#(repetir (n+1) x) = n+1
={Por (2)}
#(x : (repetir (n+1-1) x)) = n+1
={Existencia del Opuesto}
#(x : (repetir n x)) = n+1
={Por (4); x=x, xs=repetir n x}
1 + #(repetir n x) = n+1
={Por HI}
1 + n = n+1
={Conmutatividad}
n+1 = n+1
={Por Reflexivilidad del =}
True


Conclusion: La propiedad "#(repetir n x) = n" ha sido demostrada por Induccion


--Ejercicio 16 Guia 2

--Demostrar sum (duplica xs) = 2 * sum xs

Recuerdo Esctructura Funcion

duplica:: [Int] -> [Int]
duplica [] = []  (1)
duplica (x:xs) = (x*2):(duplica xs)  (2)

sum:: [Int] -> Int
sum [] = 0  (3)
sum (x:xs) = x + sum xs (4)

Caso Base

sum (duplica []) = 2 * sum []
={Por (1)}
sum [] = 2 * sum []
={Por (3) en ambos miembros de la igualdad}
0 = 2 * 0
={Elemento Destructor de la Multiplicacion}
0 = 0
={Por Reflexivilidad del =}
True

Paso Inductivo, HI = sum (duplica xs) = 2 * sum xs

sum (duplica x:xs) = 2 * sum x:xs
={Por (2)}
sum ((x*2) : (duplica xs)) = 2 * sum x:xs
={Por (4); x=x*2, xs= duplica xs}
x*2 + sum(duplica xs) = 2 * sum x:xs
={Por (4); x=x, xs= duplica xs}
x*2 + sum(duplica xs) = 2 * (x + sum xs)
={Distributividad}
x*2 + sum(duplica xs) = x*2 + 2 * sum xs
={Por HI}
x*2 + 2 * sum xs = x*2 + 2 * sum xs
={Por Reflexivilidad del =}
True


Conclusion: La propiedad "sum (duplica xs) = 2 * sum xs" ha sido demostrada por Induccion


--Ejercicio 17 Guia 2

--Demostrar concat (xss ++ yss) = concat xss ++ concat yss

Recuerdo Estructuras Funciones

(++):: [a] -> [a] -> [a]
[] ++ ys = ys  (1)
(x:xs) ++ ys = x : (xs ++ ys)  (2)

concat:: [[a]] -> [a]
concat [] = []  (3)
concat (xs:xss) = xs ++ (concat xss)  (4)

Caso Base

concat ([] ++ yss) = concat [] ++ concat yss
={Por (1); []=[], ys=yss}
concat yss = concat [] ++ concat yss
={Por (3)}
concat yss = [] ++ concat yss
={Por (1); []=[], ys=concat yss}
concat yss = concat yss
={Por Reflexivilidad del =}
True

Paso Inductivo, HI = concat (xss ++ yss) = concat xss ++ concat yss

concat (xs:xss ++ yss) = concat xs:xss ++ concat yss
={Por (2); x=xs, xs=xss, ys=yss}
concat (xs: (xss ++ yss)) = concat xs:xss ++ concat yss
={Por (4); xs=xs, xss=(xss ++ yss)}
xs ++ concat (xss ++ yss) = concat xs:xss ++ concat yss
={Por (4)}
xs ++ concat (xss ++ yss) = xs ++ concat xss ++ concat yss
={Por HI}
xs ++ concat xss ++ concat yss = xs ++ concat xss ++ concat yss
={Por Reflexivilidad del =}
True


Conclusion: La propiedad "concat (xss ++ yss) = concat xss ++ concat yss" ha sido demostrada por Induccion


--Ejercicio 18 Guia 2

--Demostrar rev(xs ++ ys) = rev ys ++ rev xs

Recuerdo Estructuras Funciones

(++):: [a] -> [a] -> [a]
[] ++ ys = ys  (1)
(x:xs) ++ ys = x : (xs ++ ys)  (2)

rev:: [a] -> [a]
rev [] = []  (3)
rev (x:xs) = (rev xs) ++ [x] (4)

Caso Base

rev([] ++ ys) = rev ys ++ rev []
={Por (1)}
rev ys = rev ys ++ rev []
={Por (3)}
rev ys = rev ys ++ []
={Por 11a, Lista Vacia es Elemento Neutro de la Concatenacion}
rev ys = rev ys
={Por Reflexivilidad del =}
True

Paso Inductivo, HI = rev(xs ++ ys) = rev ys ++ rev xs

rev(x:xs ++ ys) = rev ys ++ rev x:xs
={Por (2)}
rev(x : (xs ++ ys)) = rev ys ++ rev x:xs
={Por (4); x=x; xs=(xs ++ ys)}
rev(xs ++ ys) ++ [x] = rev ys ++ rev x:xs
={Por (4)}
rev(xs ++ ys) ++ [x] = rev ys ++ rev xs ++ [x]
={Por HI}
rev ys ++ rev xs ++ [x] = rev ys ++ rev xs ++ [x]
={Por Reflexivilidad del =}
True


Conclusion: La propiedad "rev(xs ++ ys) = rev ys ++ rev xs" ha sido demostrada por Induccion
















