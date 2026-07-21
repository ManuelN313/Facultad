--Ejercicio 19 Guia 1 (Funciones por Casos/Guardas) 

sgn:: Int -> Int
sgn x | x>0 = 1
      | x<0 = -1
      | x==0 = 0

--A
entre0y9:: Int -> Bool
entre0y9 y | y>(-1) && y<10 = True
           | y<0 || y>9 = False

--B
rangoPrecio:: Int -> String
rangoPrecio p | p<0 = "esto no puede ser"
              | p<2000 = "muy barato"
              | p<=5000 = "hay que verlo bien"
              | p>5000 = "demasiado caro"

--C  
absoluto:: Int -> Int
absoluto z | z<0 = z*(-1)
           | z>=0 = z

--D
esMultiplo2:: Int -> Bool
esMultiplo2 n | (n `mod` 2)/= 0 = False
              | (n `mod` 2)== 0 = True
