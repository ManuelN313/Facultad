--A 
maximo:: [Int] -> Int
maximo [x] = x
maximo (x:xs) = max x (maximo xs)

maximo [2,5,1,7,3] = 7
max 2 (maximo [5,1,7,3])
max 2 (max 5 (maximo [1,7,3]))
max 2 (max 5 (max 1 (maximo[7,3])))
max 2 (max 5 (max 1 (max 7 (maximo [3]))))
max 2 (max 5 (max 1 (max 7 3)))
max 2 (max 5 (max 1 7))
max 2 (max 5 7)
max 2 7
7 = 7

--B 
sumaPares:: [(Int,Int)] -> Int
sumaPares [] = 0
sumaPares ((x,y):xs) = (x+y) + sumaPares xs

sumaPares [(1,2),(7,8),(11,0)] = 29
(1+2) + sumaPares [(7,8),(11,0)]
(1+2) + (7+8) + sumaPares [(11,0)]
(1+2) + (7+8) + (11+0) + sumaPares []
(1+2) + (7+8) + (11+0) + 0
3 + 15 + 11 + 0
3 + 15 + 11
3 + 26
29 = 29

--C 
todos0y1:: [Int] -> Bool
todos0y1 [] = True
todos0y1 (x:xs) = ((x == 1) || (x == 0)) && (todos0y1 xs)

todos0y1 [1,0,1,2,0,1] = False
( (1 == 1) || (1 == 0) ) && (todos0y1 [0,1,2,0,1])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && (todos0y1 [1,2,0,1])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && (todos0y1 [2,0,1])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && ( (2 == 1) || (2 == 0) ) && (todos0y1 [0,1])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && ( (2 == 1) || (2 == 0) ) && ( (0 == 1) || (0 == 0) ) && (todos0y1 [1])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && ( (2 == 1) || (2 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && (todos0y1 [])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && ( (2 == 1) || (2 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && True
( True || False ) && ( False || True ) && ( True || False ) && ( False || False ) && ( False || True ) && ( True || False ) && True
True && True && True && False && True && True && True
False = False

todos0y1 [1,0,1,0,0,1] = True
( (1 == 1) || (1 == 0) ) && (todos0y1 [0,1,0,0,1])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && (todos0y1 [1,0,0,1])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && (todos0y1 [0,0,1])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && (todos0y1 [0,1])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (0 == 1) || (0 == 0) ) && (todos0y1 [1])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && (todos0y1 [])
( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (0 == 1) || (0 == 0) ) && ( (1 == 1) || (1 == 0) ) && True
( True || False ) && ( False || True ) && ( True || False ) && ( False || True ) && ( False || True ) && ( True || False ) && True
True && True && True && True && True && True && True
True = True


--D 
quitar0s:: [Int] -> [Int]
quitar0s [] = []
quitar0s (x:xs) | (x == 0) = quitar0s xs
                | otherwise = x : (quitar0s xs)

quitar0s [2,0,3,4] = [2,3,4]
2 : (quitar0s [0,3,4])
2 : (quitar0s [3,4])
2 : (3 : (quitar0s [4]))
2 : (3 : (4 : (quitar0s [])))
2 : (3 : (4 : []))
2 : (3 : [4])
2 : [3,4]
[2,3,4]

--E 
ultimo:: [a] -> a
ultimo [a] = a
ultimo (x:xs) = ultimo xs

ultimo [10,5,3,1] = 1
ultimo [5,3,1]
ultimo [3,1]
ultimo [1]
1 = 1

--F
repetir:: Int -> Int -> [Int]
repetir 0 n = []
repetir n x = x : (repetir (n-1) x)

repetir 3 6 = [6,6,6]
6 : (repetir (3-1) 6)
6 : (repetir (2) 6)
6 : (6 : (repetir (2-1) 6))
6 : (6 : (repetir (1) 6))
6 : (6 : (6 : (repetir (1-1) 6)))
6 : (6 : (6 : (repetir (0) 6)))
6 : (6 : (6 : []))
6 : (6 : [6])
6 : [6,6]
[6,6,6] = [6,6,6]

--G (Tipo Unzip)
concate:: [[a]] -> [a]
concate [] = []
concate (xs:xss) = xs ++ (concate xss)

concate [[1,4],[],[2]] = [1,4,2]
[1,4] ++ (concate [[],[2]])
[1,4] ++ [] ++ (concate [[2]])
[1,4] ++ [] ++ [2] ++ (concate [[]])
[1,4] ++ [] ++ [2] ++ []
[1,4] ++ [] ++ [2]
[1,4] ++ [2]
[1,4,2] = [1,4,2]

--H (Tipo Map)
reversa:: [a] -> [a]
reversa [] = [] 
reversa (x:xs) = (reversa xs) ++ ([x])

reversa [1,2,3] = [3,2,1]
reversa [2,3] ++ [1]
reversa [3] ++ [2] ++ [1]
reversa [] ++ [3] ++ [2] ++ [1]
[] ++ [3] ++ [2] ++ [1]
[] ++ [3] ++ [2,1]
[] ++ [3,2,1]
[3,2,1] = [3,2,1]









