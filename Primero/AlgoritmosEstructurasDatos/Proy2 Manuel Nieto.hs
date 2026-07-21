--Proyecto 2 Manuel Nieto

--Ejercicio 1 y 2
--A
data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Show, Eq, Ord, Bounded, Enum)

--B 
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

--Ejercicio 3

--A
type Ingreso = Int

data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar deriving Show

data Area = Administrativa | Ensenanza | Economica | Postgrado deriving Show

data Persona = Decano | Docente Cargo | NoDocente Area | Estudiante Carrera Ingreso deriving Show


--B El Tipo del Constructor Docente es Persona. 

--C
es_doc :: Cargo -> Persona -> Bool
es_doc Titular (Docente Titular) = True
es_doc Asociado (Docente Asociado) = True
es_doc Adjunto (Docente Adjunto) = True
es_doc Asistente (Docente Asistente) = True
es_doc Auxiliar (Docente Auxiliar) = True
es_doc _ _ = False

cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc [] _ = 0
cuantos_doc (x:xs) cargo | es_doc cargo x = 1 + caso_rec
                         | otherwise = caso_rec
                         where caso_rec = cuantos_doc xs cargo 

--D
cuantos_doc' :: [Persona] -> Cargo -> Int
cuantos_doc' xs cargo = length (filter (es_doc cargo) xs)

--4
--A
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:_) = Just x

--5
data Cola = VaciaC | Encolada Persona Cola deriving Show --Solo les pongo Clase Show para poder ver como aparecen los datos.

--A1
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada _ VaciaC) = Nothing
atender (Encolada _ xs) = Just xs

--A2
encolar :: Persona -> Cola -> Cola
encolar p VaciaC = Encolada p VaciaC
encolar p (Encolada x xs) = Encolada x (encolar p xs)

--A3
busca :: Cola -> Cargo -> Maybe Persona
busca VaciaC _ = Nothing
busca (Encolada p ps) cargo | es_doc cargo p = Just p
                            | otherwise = busca ps cargo

--B El tipo Cola se parece al Tipo Lista debido a que sus dos contructores son muy parececidos con los de este tipo. VaciaC es similar a [] y Encolado Persona Cola es semejante a : .

--6
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

type Diccionario = ListaAsoc String String

type Padron = ListaAsoc Int String

--A Se deberia Instaciar de la Siguiente forma type Guia = ListaAsoc Int String, donde Int es el numero telefonico y String es el nombre de la persona o empresa.

--B1
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo _ _ xs) = 1 + la_long xs

--B2
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia xs = xs
la_concat (Nodo x y xys) ss = (Nodo x y (la_concat xys ss))

--B3
la_pares :: ListaAsoc a b -> [(a,b)]
la_pares Vacia = []
la_pares (Nodo x y xs) = (x,y) : la_pares xs

--B4
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia _ = Nothing
la_busca (Nodo x y xys) clave | x == clave = Just y
                              | otherwise = la_busca xys clave

--B5 (Solo Borrar al Elemento una vez, es decir, que si aparece varias veces solo lo elimina una unica vez)
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia
la_borrar clave (Nodo x y xys) | x == clave = xys
                               | otherwise = (Nodo x y (la_borrar clave xys))  


--7

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving Show

type Prefijos = Arbol String

--Arboles para ejecutar Codigo

arbol_guia :: Arbol [Char] 
arbol_guia = (Rama (Rama (Rama Hoja "rio" Hoja) "a" (Rama Hoja "s" Hoja)) "can" (Rama (Rama Hoja "ar" Hoja) "t" (Rama Hoja "o" Hoja)))

arbol_num :: Arbol Int 
arbol_num = (Rama (Rama (Rama Hoja 1 Hoja) 3 (Rama Hoja 4 Hoja)) 5 (Rama (Rama Hoja 6 Hoja) 7 (Rama Hoja 8 Hoja)))


--A
a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama arb1 _ arb2) = a_long arb1 + 1 + a_long arb2

--B 
a_hojas :: Arbol a -> Int
a_hojas Hoja = 1
a_hojas (Rama arb1 _ arb2) = a_hojas arb1 + a_hojas arb2 
                              
--C
a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama arb1 x arb2) = (Rama (a_inc arb1) (x+1) (a_inc arb2)) 

--D
a_map :: (a -> b) -> Arbol a -> Arbol b 
a_map _ Hoja = Hoja
a_map p (Rama arb1 x arb2) = (Rama (a_map p arb1) (p x) (a_map p arb2))

--C'
a_inc' :: Num a => Arbol a -> Arbol a
a_inc' arb = a_map (+1) arb




