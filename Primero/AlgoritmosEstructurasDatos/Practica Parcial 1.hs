hayDesaprobado :: [(Int,String)] -> Bool
hayDesaprobado [] = False
hayDesaprobado ((_,y):xs) = (y == "desaprobado") || hayDesaprobado xs

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] _ = False
existe' (x:xs) p = (p x) || (existe' xs p)

desaprobado :: (Int,String) -> Bool
desaprobado (_,y) = y == "desaprobado"

hayDesaprobado' :: [(Int,String)] -> Bool
hayDesaprobado' xs = existe' xs desaprobado

todosAprobados :: [(Int,String)] -> Bool
todosAprobados [] = True
todosAprobados ((_,y):xs) = (y == "aprobado") && todosAprobados xs

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] _ = True
paratodo' (x:xs) p = (p x) && (paratodo' xs p)

aprobado :: (Int,String) -> Bool
aprobado (_,y) = y == "aprobado"

todosAprobados' :: [(Int,String)] -> Bool
todosAprobados' xs = paratodo' xs aprobado

capicua :: Eq a => [a] -> Bool
capicua xs = xs == reverse xs

todosCapicuas :: Eq a => [[a]] -> Bool
todosCapicuas xs = paratodo' xs capicua

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + (sumatoria xs)

promedio :: [Int] -> Int
promedio [] = 0 --No es Necesario ponerlo, pero es para que no me salga Warnings
promedio (x:xs) = div (sumatoria (x:xs)) (length (x:xs))

sinAplazos :: [Int] -> [Int]
sinAplazos [] = []
sinAplazos (x:xs) | x > 4 = x : sinAplazos xs
                  | otherwise = sinAplazos xs  

promediosSinAplazos :: [[Int]] -> [Int]
promediosSinAplazos xs = map promedio (map sinAplazos xs)

encontrarLa :: String -> Bool
encontrarLa [] = False
encontrarLa [_] = False
encontrarLa (x:y:xs) = (x == 'L' && y == 'a') || encontrarLa xs




