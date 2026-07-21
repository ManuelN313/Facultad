--Ejercicio 19 Guia 2

--A Desmostrar xs ++ (ys ++ zs) = (xs ++ ys) ++ zs

Recordar Estructura Funcion

(++):: [a] -> [a] -> [a]
[] ++ ys = ys                  (1) 
(x:xs) ++ ys = x : (xs ++ ys)  (2)

Caso Base

[] ++ (ys ++ zs) = ([] ++ ys) ++ zs
≡{Por (1); []:=[], ys=(ys ++ zs)}
ys ++ zs = ([] ++ ys) ++ zs
≡{Por (1)}
ys ++ zs = ys ++ zs
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = xs ++ (ys ++ zs) = (xs ++ ys) ++ zs

(x:xs) ++ (ys ++ zs) = ((x:xs) ++ ys) ++ zs
≡{Por (2); x:=x; xs:=xs; ys:=(ys ++ zs)}
x : (xs ++ (ys ++ zs)) = ((x:xs) ++ ys) ++ zs
≡{Por (2)}
x : (xs ++ (ys ++ zs)) = x : (xs ++ ys) ++ zs
≡{Por HI}
x : (xs ++ ys) ++ zs =  x : (xs ++ ys) ++ zs
≡{Por Reflexivilidad del =}
True

Conclusion: Por Induccion queda demostrada que la propiedad "xs ++ (ys ++ zs) = (xs ++ ys) ++ zs" es Verdadera

 
--B Demostrar (xs ++ ys) ↑ #xs = xs

Recordar Estructura Funcion

(++):: [a] -> [a] -> [a]
[] ++ ys = ys                   (1) 
(x:xs) ++ ys = x : (xs ++ ys)   (2)

(↑):: [a] -> Int -> [a]
xs ↑ 0 = []                     (3)
[] ↑ n = []                     (4)
(x:xs) ↑ n = x : (xs ↑ (n-1))   (5)

#:: [a] -> Int
#[] = 0                         (6)
#x:xs = 1 + #xs                 (7)

Caso Base

([] ++ ys) ↑ #[] = []
≡{Por (1)}
ys ↑ #[] = []
≡{Por (6)}
ys ↑ 0 = []
≡{Por (3); xs:=ys, 0:=0}
[] = []
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = (xs ++ ys) ↑ #xs = xs 

(x:xs ++ ys) ↑ #x:xs = x:xs
≡{Por (2)}
(x:(xs ++ ys)) ↑ #x:xs = x:xs
≡{Por (7)}
(x:(xs ++ ys)) ↑ 1 + #xs = x:xs
≡{Por (5); x:=x, xs:=(xs ++ ys); n:=(1 + #xs)}
x:((xs ++ ys) ↑ (1 + #xs - 1)) = x:xs 
≡{Por Existencia del Opuesto}
x:((xs ++ ys) ↑ (#xs + 0)) = x:xs 
≡{Por Elemento Neutro de la Suma}
x:((xs ++ ys) ↑ #xs) = x:xs
≡{Por HI}
x:xs = x:xs
≡{Por Reflexivilidad del =}
True

Conclusion: Por Induccion queda demostrada que la propiedad "(xs ++ ys) ↑ #xs = xs" es Verdadera


--C Demostrar (xs ++ ys) ↓ #xs = ys

Recordar Estructuras Funciones

(++):: [a] -> [a] -> [a]
[] ++ ys = ys                   (1) 
(x:xs) ++ ys = x : (xs ++ ys)   (2)

(↓):: [a] -> Int -> [a]
xs ↓ 0 = xs                     (3)
[] ↓ n = []                     (4)
(x:xs) ↓ n =  xs ↓ (n-1)        (5)

#:: [a] -> Int
#[] = 0                         (6)
#x:xs = 1 + #xs                 (7)

Caso Base

([] ++ ys) ↓ #[] = ys
≡{Por (1)}
ys ↓ #[] = ys
≡{Por (6)} 
ys ↓ 0 = ys
≡{Por (3); xs:=ys, 0:=0}
ys = ys
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = (xs ++ ys) ↓ #xs = ys 

(x:xs ++ ys) ↓ #x:xs = ys 
≡{Por (2)}
(x:(xs ++ ys)) ↓ #x:xs = ys
≡{Por (7)}
(x:(xs ++ ys)) ↓ (1 + #xs) = ys
≡{Por (5); x:=x, xs:=(xs ++ ys), n:=(1 + #xs)}
(xs ++ ys) ↓ (1 + #xs -1) = ys
≡{Por Existencia del Opuesto}
(xs ++ ys) ↓ (#xs + 0) = ys
≡{Por Elemento Neutro de la Suma}
(xs ++ ys) ↓ #xs = ys
≡{Por HI}
ys = ys
≡{Por Reflexivilidad del =}
True

Conclusion: Por Induccion queda demostrada que la propiedad "(xs ++ ys) ↓ #xs = ys" es Verdadera


--D Demostrar xs ++ (y:ys) = (xs ◄ y) ++ ys

Recuerdo Estructura Funciones

(++):: [a] -> [a] -> [a]
[] ++ ys = ys                   (1) 
(x:xs) ++ ys = x : (xs ++ ys)   (2)

(◄):: [a] -> a -> [a]
[] ◄ y = y:[]                   (3)
(x:xs) ◄ y = x : (xs ◄ y)       (4)

Caso Base

[] ++ (y:ys) = ([] ◄ y) ++ ys
≡{Por (1); []:=[], ys:=(y:ys)}
y:ys = ([] ◄ y) ++ ys
≡{Por (3)}
y:ys = y:[] ++ ys
≡{Por (2); x:=y, xs:=[], ys:=ys}
y:ys = y:([] ++ ys}
≡{Por (1)}
y:ys = y:ys
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = xs ++ (y:ys) = (xs ◄ y) ++ ys

x:xs ++ (y:ys) = (x:xs ◄ y) ++ ys
≡{Por (2); x:=x, xs:=xs, ys:=(y:ys)}
x:(xs ++ (y:ys) = (x:xs ◄ y) ++ ys
≡{Por (4)}
x:(xs ++ (y:ys) = (x:(xs ◄ y)) ++ ys
≡{Por (2); x:=x, xs:=(xs ◄ y), ys:=ys}
x:(xs ++ (y:ys) = x:((xs ◄ y) ++ ys)
≡{Por HI}
x:((xs ◄ y) ++ ys) = x:((xs ◄ y) ++ ys)
≡{Por Reflexivilidad del =}
True

Conclusion: Por Induccion queda demostrada que la propiedad "xs ++ (y:ys) = (xs ◄ y) ++ ys" es Verdadera


--E Demostrar xs ++ (ys ◄ y) = (xs ++ ys) ◄ y

Recuerdo Estructuras Funciones
  
(++):: [a] -> [a] -> [a]
[] ++ ys = ys                   (1) 
(x:xs) ++ ys = x : (xs ++ ys)   (2)

(◄):: [a] -> a -> [a]
[] ◄ y = y:[]                   (3)
(x:xs) ◄ y = x : (xs ◄ y)       (4)

Caso Baso

[] ++ (ys ◄ y) = ([] ++ ys) ◄ y
≡{Por (1); []:=[], ys:=(ys ◄ y)}
ys ◄ y = ([] ++ ys) ◄ y
≡{Por (1)}
ys ◄ y = ys ◄ y
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = xs ++ (ys ◄ y) = (xs ++ ys) ◄ y

x:xs ++ (ys ◄ y) = (x:xs ++ ys) ◄ y
≡{Por (2); x:=x, xs:=xs, ys:=(ys ◄ y)}
x:(xs ++ (ys ◄ y)) = (x:xs ++ ys) ◄ y
≡{Por (2)}
x:(xs ++ (ys ◄ y)) = (x:(xs ++ ys)) ◄ y
≡{Por (4); x:=x, xs:=(xs ++ ys), y:=y}
x:(xs ++ (ys ◄ y)) = x:((xs ++ ys) ◄ y)
≡{Por HI}
x:((xs ++ ys) ◄ y) = x:((xs ++ ys) ◄ y)
≡{Por Reflexivilidad del =}
True

Conclusion: Por Induccion queda demostrada que la propiedad "xs ++ (ys ◄ y) = (xs ++ ys) ◄ y" es Verdadera


--Ejercicio 20 Guia 2

--A Demostrar F n = 2*n

Estructura Funcion

F:: Int -> Int
F 0 = 0           (1)
F n = 2 + F (n-1) (2)

Caso Base

F 0 = 2*0
≡{Por (1)}
0 = 2*0
≡{Por Elemento Destructor de la Multiplicacion}
0 = 0
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = F n = 2*n

F (n+1) = 2*(n+1)
≡{Por (2); n:=(n+1)}
2 + F ((n+1)-1) = 2*(n+1)
≡{Por Existencia del Opuesto}
2 + F (n+0) = 2*(n+1)
≡{Por Elemento Neutro de la Suma}
2 + F n = 2*(n+1)
≡{Por Distribucion}
2 + F n = 2 + 2*n 
≡{Por HI}
2 + 2*n = 2 + 2*n 
≡{Por Reflexivilidad del =}
True

Conclusion: Por Induccion queda demostrada que la propiedad "F n = 2*n" es Verdadera


--B Demostrar G n = n

Estructura Funcion

G:: Int -> Int
G 0 = 0            (1)
G n = 1 + G (n-1)  (2)

Caso Base

G 0 = 0
≡{Por (1)}
0 = 0
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = G n = n

G (n+1) = n + 1
≡{Por (1); n:=(n+1)}
1 + G ((n+1)-1) = n + 1
≡{Por Existencia del Opuesto}
1 + G (n+0) = n + 1
≡{Por Elemento Neutro de la Suma}
1 + G n = n + 1
≡{Por HI}
1 + n = n + 1
≡{Por Conmutatividad}
n + 1 = n + 1
≡{Por Reflexivilidad del =}
True

Conclusion: Por Induccion queda demostrada que la propiedad "G n = n" es Verdadera


--C Demostrar F n = G n

Estructura Funciones

F:: Int -> Int
F n = n*(n+1)/2      (1)

G:: Int -> Int
G 0 = 0              (2)
G (n+1) = n+1+G n    (3)

Caso Base

F 0 = G 0
≡{Por (1); n:=0}
0*(0+1)/2 = G 0
≡{Por (2)
0*(0+1)/2 = 0
≡{Por Aritmetica}
0*1/2 = 0
≡{Por Elemento Destructor de la Multiplicacion}
0/2 = 0
≡{Por Aritmetica}
0 = 0
≡{Por Reflexivilidad del =}
True

Paso Inductivo, HI = F n = G n

F (n+1) = G (n+1)
≡{Por (1); n:=(n+1)}
(n+1)*((n+1)+1)/2 =  G (n+1)
≡{Por (3)}
(n+1)*((n+1)+1)/2 = n+1+G n 
≡{Por HI}
(n+1)*((n+1)+1)/2 = n+1+F n
≡{Por (1)}
(n+1)*((n+1)+1)/2 = (n+1)+n*(n+1)/2
≡{Por Aritmetica}
(n+1)*((n+2)/2 = (n+1)+n*(n+1)/2
≡{Por Suma de Fracciones}
(n+1)*(n+2)/2 = (n+1)*2/2+n*(n+1)/2
≡{Por Factor Comun de /2}
(n+1)*(n+2)/2 = ((n+1)*2+n*(n+1))/2
≡{Por Distribucion y Asociatividad}
n²+2n+n+2/2 = 2n+2+n²+n/2
≡{Por Conmutatividad}
n²+3n+2/2 = n²+3n+2/2
≡{Por Reflexivilidad del =}
True

Conclusion: Por Induccion queda demostrada que la propiedad "F n = G n" es Verdadera


--Ejercicio 21 Guia 2

--A

--I
listasIguales:: Eq a => [a] -> [a] -> Bool
listasIguales [] [] = True
listasIguales [] xs = False
listasIguales (x:xs) (y:ys) | (x == y) = listasIguales xs ys
                            | (x /= y) = False

--II 

listasIguales [1,2,3] [1,2,3] = True
listasIguales 1:[2,3] 1:[2,3]
(1 = 1) && listasIguales [2,3] [2,3]
(1 = 1) && listasIguales 2:[3] 2:[3]
(1 = 1) && (2 = 2) && listasIguales [3] [3]
(1 = 1) && (2 = 2) && listasIguales 3:[] 3:[]
(1 = 1) && (2 = 2) && (3 = 3) && listasIguales [] []
True && True && True && True
True && True && True 
True && True 
True = True

listasIguales [1,2,3,4] [1,3,2,4] = False
listasIguales 1:[2,3,4] 1:[3,2,4]
(1 = 1) && listasIguales [2,3,4] [3,2,4]
(1 = 1) && listasIguales 2:[3,4] 3:[2,4]
(1 = 1) && (2 = 3) && listasIguales [3,4] [2,4]
(1 = 1) && (2 = 3) && listasIguales 3:[4] 2:[4]
(1 = 1) && (2 = 3) && (3 = 2) && listasIguales [4] [4]
(1 = 1) && (2 = 3) && (3 = 2) && listasIguales 4:[] 4:[]
(1 = 1) && (2 = 3) && (3 = 2) && (4 = 4) && listasIguales [] []
True && False && False && True && True
True && False && False && True
True && False && False 
True && False  
False = False

--III Funcion Tipo Fold


--B

--I
mejorNota:: [(String,Int,Int,Int)] -> [(String,Int)]
mejorNota [] = []
mejorNota ((alumno,x,y,z):xs) = (alumno, max x (max y z)): mejorNota xs

--II
mejorNota [("Matias",7,7,8),("Juan",10,6,9),("Lucas",2,10,10)] = [("Matias",8),("Juan",10),("Lucas",10)]
mejorNota ("Matias",7,7,8):[("Juan",10,6,9),("Lucas",2,10,10)]
("Matias", max 7 (max 7 8)) : mejorNota [("Juan",10,6,9),("Lucas",2,10,10)]
("Matias", max 7 (max 7 8)) : mejorNota ("Juan",10,6,9) : [("Lucas",2,10,10)]
("Matias", max 7 (max 7 8)) : ("Juan", max 10 (max 6 9)) : mejorNota [("Lucas",2,10,10)]
("Matias", max 7 (max 7 8)) : ("Juan", max 10 (max 6 9)) : mejorNota ("Lucas",2,10,10):[]
("Matias", max 7 (max 7 8)) : ("Juan", max 10 (max 6 9)) : ("Lucas", max 2 (max 10 10)) : mejorNota []
("Matias", max 7 (max 7 8)) : ("Juan", max 10 (max 6 9)) : ("Lucas", max 2 (max 10 10)) : []
("Matias", max 7 8) : ("Juan", max 10 9) : ("Lucas", max 2 10) : []
("Matias",8) : ("Juan",10) : ("Lucas",10) : []
("Matias",8) : ("Juan",10) : ("Lucas",10) : []
("Matias",8) : ("Juan",10) : [("Lucas",10)]
("Matias",8) : [("Juan",10),("Lucas",10)]
[("Matias",8),("Juan",10),("Lucas",10)] = [("Matias",8),("Juan",10),("Lucas",10)]

--III Funcion de Tipo Filter


--C

--I
incPrim::[(Int,Int)] -> [(Int,Int)]
incPrim [] = []
incPrim ((x,y):xs) = (x+1,y) : incPrim xs

--II
incPrim [(20,5),(50,9)] = [(21,5),(51,9)]
incPrim (20,5) : [(50,9)]
(20+1,5) : incPrim [(50,9)]
(20+1,5) : incPrim (50,9) : []
(20+1,5) : (50+1,9) : incPrim []
(21,5) : (51,9) : []
(21,5) : [(51,9)]
[(21,5),(51,9)] = [(21,5),(51,9)]

incPrim [(4,11),(3,0)] = [(5,11),(4,0)]
incPrim (4,11) : [(3,0)]
(4+1,11) : incPrim [(3,0)]
(4+1,11) : incPrim (3,0) : []
(4+1,11) : (3+1,0) : incPrim []
(5,11) : (4,0) : []
(5,11) : [(4,0)]
[(5,11),(4,0)] = [(5,11),(4,0)]

--III Funcion Tipo Map


--D

--I
length:: [a] -> Int
length [] = 0                       
length (x:xs) = 1 + length xs

expandir:: String -> String
expandir [] = []
expandir (x:xs) | (length(xs) > 0 ) = x : ' ' : expandir xs
                | (length(xs) == 0 ) = x : expandir xs 

--II
expandir "Hola" = "H o l a"
expandir 'H' : "ola"
(length("ola") > 0 ) 
(3 > 0) -> True
'H' : ' ' : expandir "ola"
'H' : ' ' : expandir 'o' : "la"
(length("la") > 0 )
(2 > 0) -> True
'H' : ' ' : 'o' : ' ' : expandir "la"
'H' : ' ' : 'o' : ' ' : expandir 'l' : "a"
(length("a") > 0 )
(1 > 0) -> True
'H' : ' ' : 'o' : ' ' : 'l' : ' ' : expandir "a"
'H' : ' ' : 'o' : ' ' : 'l' : ' ' : expandir 'a' : []
(length([]) > 0 )
(0 > 0) -> False
(length([]) == 0 )
(0 == 0) -> True
'H' : ' ' : 'o' : ' ' : 'l' : ' ' : 'a' : expandir []
'H' : ' ' : 'o' : ' ' : 'l' : ' ' : 'a' : []
'H' : ' ' : 'o' : ' ' : 'l' : ' ' : "a"
'H' : ' ' : 'o' : ' ' : 'l' : " a"
'H' : ' ' : 'o' : ' ' : "l a"
'H' : ' ' : 'o' : " l a"
'H' : ' ' : "o l a"
'H' : " o l a"
"H o l a" = "H o l a"


--III Funcion Tipo Map


--Ejercicio 22

type Pelicula = (String, Int, Int, String)
peliculas :: [Pelicula]
peliculas = [("¿Quieres ser John Malkovich?", 1999, 112,"Spike Jonze"),
             ("¿Y dónde está el piloto?", 1980, 88,"Jim Abrahams, David Zucker"),
	     ("A Clockwork Orange", 1971, 136,"Stanley Kubrick"),
             ("América X", 1998, 119,"Tony Kaye"),
             ("Amor eterno", 2004, 133,"Jean-Pierre Jeunet"),
             ("Analízame", 1999, 103,"Harold Ramis"),
             ("Asesinos por naturaleza", 1994, 118,"Oliver Stone"),
             ("Borat: El segundo mejor reportero del glorioso país Kazajistán viaja a América", 2006, 84,"Larry Charles"),
             ("Brüno", 2009, 81,"Larry Charles"),
             ("Buenos muchachos", 1990, 146,"Martin Scorsese"),
             ("Ciudad de Dios", 2002, 130,"Fernando Meirelles, Kátia Lund"),
             ("Cloud Atlas: La red invisible", 2012, 172,"Tom Tykwer, Andy Wachowski"),
             ("Delicatessen", 1991, 99,"Marc Caro, Jean-Pierre Jeunet"),
             ("Django sin cadenas", 2012, 165,"Quentin Tarantino"),
             ("El abogado del diablo", 1997, 144,"Taylor Hackford"),
             ("El ciudadano", 1941, 119,"Orson Welles"),
             ("El club de la pelea", 1999, 139,"David Fincher"),
             ("El cocodrilo", 1999, 82,"Steve Miner"),
             ("El embajador del miedo", 2004, 129,"Jonathan Demme"),
             ("El habitante incierto", 2004, 90,"Guillem Morales"),
             ("El ilusionista", 2006, 110,"Neil Burger"),
             ("El maquinista", 2004, 101,"Brad Anderson"),
             ("El mundo está loco loco", 2001, 112,"Jerry Zucker"),
             ("El padrino", 1972, 175,"Francis Ford Coppola"),
             ("El pianista", 2002, 150,"Roman Polanski"),
             ("El plan perfecto", 2006, 129,"Spike Lee"),
             ("El resplandor", 1980, 100,"Stanley Kubric"),
             ("El señor de los anillos: La comunidad del anillo", 2001, 178,"Peter Jackson"),
             ("Estamos todos locos", 1983, 107,"Terry Jones, Terry Gilliam"),
             ("Eterno resplandor de una mente sin recuerdos", 2004, 108,"Michel Gondry"),
             ("Gánster americano", 2007, 157,"Ridley Scott"),
             ("Gran Torino", 2008, 116,"Clint Eastwood"),
             ("Guerra de los mundos", 2005, 116,"Steven Spielberg"),
             ("Hechizo del tiempo", 1993, 101,"Harold Ramis"),
             ("Historias cruzadas", 2011, 146,"Tate Taylor"),
             ("Juegos sexuales", 1999, 97,"Roger Kumble"),
             ("Kill Bill, la venganza: Volumen I", 2003, 111,"Quentin Tarantino"),
             ("La caída", 2004, 156,"Oliver Hirschbiegel"),
             ("La edad de la inocencia", 1993, 139,"Martin Scorsese"),
             ("La niebla", 2007, 126,"Frank Darabont"),
             ("La noche del demonio", 2010, 103,"James Wan"),
             ("La ola", 2008, 107,"Dennis Gansel"),
             ("La vida de Brian", 1979, 94,"Terry Jones"),
             ("La vida de los otros", 2006, 137,"Florian Henckel von Donnersmarck"),
             ("Los caballeros de la mesa cuadrada", 1975, 91,"Terry Gilliam, Terry Jones"),
             ("Los otros", 2001, 101,"Alejandro Amenábar"),
             ("Los sospechosos de siempre", 1995, 106,"Bryan Singer"),
             ("Magdalene Sisters: En el nombre de Dios", 2002, 119,"Peter Mullan"),
             ("Magnolia", 1999, 188,"Paul Thomas Anderson"),
             ("Martha Marcy May Marlene", 2011, 102,"Sean Durkin"),
             ("Matrix", 1999, 136,"The Wachowski Brothers, The Wachowski Brothers"),
             ("Mississippi en llamas", 1988, 128,"Alan Parker"),
             ("Número 23", 2007, 101,"Joel Schumacher"),
             ("Pandillas de Nueva York", 2002, 167,"Martin Scorsese"),
             ("Perros de la calle", 1992, 99,"Quentin Tarantino"),
             ("Petróleo sangriento", 2007, 158,"Paul Thomas Anderson"),
             ("Pi", 1998, 84,"Darren Aronofsky"),
             ("Promesas del este", 2007, 100,"David Cronenberg"),
             ("Psicópata americano", 2000, 102,"Mary Harron"),
             ("Réquiem para un sueño", 2000, 102,"Darren Aronofsky"),
             ("Sueños de libertad", 1994, 142,"Frank Darabont"),
             ("Taxi Driver", 1976, 113,"Martin Scorsese"),
             ("The Butcher Boy", 1997, 110,"Neil Jordan"),
             ("The Weather Man", 2005, 102,"Gore Verbinski")]

--A
verTodas:: [Pelicula] -> Int
verTodas [] = 0
verTodas ((nombre,ano,dura,direc):xs) = dura + verTodas xs

--B
estrenos:: [Pelicula] -> [String]
estrenos [] = []
estrenos ((nombre,ano,dura,direc):xs) | (ano == 2016) = nombre : estrenos xs
                                      | otherwise = estrenos xs

--C 
filmografia:: [Pelicula] -> String -> [String]
filmografia [] director = []
filmografia ((nombre,ano,dura,direc):xs) director | (direc == director) = nombre : (filmografia xs director)
                                                  | otherwise = (filmografia xs director)

--D
duracion:: [Pelicula] -> String -> Int
duracion [] peli = 0
duracion ((nombre,ano,dura,direc):xs) peli | (nombre == peli) = dura
                                           | otherwise = duracion xs peli






















