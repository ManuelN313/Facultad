--Ejercicio 20 Guia 1 (Funcion Mod)
esMultiploDe:: Int -> Int -> Bool
esMultiploDe num1 num2 = num2 `mod` num1 == 0

--Ejercicio 21 Guia 1 (Operadores Logicos)
esBisiesto:: Int -> Bool
esBisiesto num = esMultiploDe 400 num || ((esMultiploDe 4 num) && not (esMultiploDe 100 num))

--Ejercicio 22 Guia 1 (Reutilizando Funciones, Max, Min)
maximoEntreTres:: Int -> Int -> Int -> Int
maximoEntreTres a b c = max (max a b) c

minimoEntreTres:: Int -> Int -> Int -> Int
minimoEntreTres d e f = min (min d e) f

dispersion:: Int -> Int -> Int -> Int
dispersion num1 num2 num3 = (maximoEntreTres num1 num2 num3) - (minimoEntreTres num1 num2 num3)

--Ejercicio 23 Guia 1 
deCelsiusAFarenheit:: Float -> Float
deCelsiusAFarenheit temp = temp * 1.8 + 32

--Ejercicio 24 Guia 1 
deFarenheitACelsius:: Float -> Float
deFarenheitACelsius temp = (temp - 32)/1.8

--Ejercicio 25 Guia 1 (Composicion de Funciones)
haceFrioCelsius:: Float -> Bool
haceFrioCelsius temp = temp < 8

haceFrioFarenheit:: Float -> Bool
haceFrioFarenheit = haceFrioCelsius.deFarenheitACelsius



