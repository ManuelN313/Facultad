-- LIBRERIAS NECESARIAS
-- =============================
import Data.List()


-- DECLARACION DE TADS
-- =============================
type Hora = Int
type Email = String
type Nombre = String

data Dia = Domingo | Lunes | Martes | Miercoles | Jueves | Viernes | Sabado
    deriving(Show, Eq, Enum, Ord)

data Actividad = Nada | Dormir | Estudiar | Recreacion
    deriving (Show)

data Usuario = Usuario {u_nombre :: Nombre, u_email :: Email} deriving(Show)

data Tarea = Hacer Hora Dia Actividad
    deriving(Show)

data Calendario = VacioC | Evento Usuario Tarea Calendario
    deriving(Show)


-- ESPECIFICACION DE FUNCIONES
-- =============================

-- NOTA: Para los ejercicios deben usar los tipos provistos. NO PUEDEN
-- modificarlos o hacer que pertenezcan a un tipo de clase (Eq, Enum, ..., etc)
-- distinto a las ya dadas.


-- EJERCICIO 1: Programe las siguientes funciones.

-- Dado una hora, un día y una actividad, crea una nueva tarea.
nueva_tarea :: Hora -> Dia -> Actividad -> Tarea
nueva_tarea t d a = Hacer t d a

-- Dado un nombre y un email, crea un nuevo usuario.
nuevo_usuario :: Nombre -> Email -> Usuario
nuevo_usuario n e = Usuario n e

-- Dado un calendario, usuario y una tarea, agrega un nuevo evento en el
-- calendario siempre que la actividad no sea Nada.
nuevo_evento :: Calendario -> Usuario -> Tarea -> Calendario
nuevo_evento calendario _ (Hacer _ _ Nada) = calendario
nuevo_evento calendario user tarea = (Evento user tarea calendario)

-- EJERCICIO 2: Programe las siguientes funciones por recursión.

-- Dado un calendario, cuenta la cantidad de eventos agendados.
cant_eventos :: Calendario -> Int
cant_eventos VacioC = 0
cant_eventos (Evento _ _ calendario) = 1 + cant_eventos calendario

-- Dado un calendario y un email de usuario, elimina todos los eventos de ese
-- usuario en el calendario
eliminar_evento :: Calendario -> Email -> Calendario
eliminar_evento VacioC _ = VacioC
eliminar_evento (Evento (Usuario u mail) t calendario) m | mail == m = repetir
                                                         | otherwise = (Evento (Usuario u mail) t repetir)
                                                         where repetir = eliminar_evento calendario m 
   
-- Dado un calendario y un email de usuario, devolver todos los datos del usuario
-- que figuran en el calendario. Si tal usuario no ha agendado ningun evento 
-- devolver Nothing.
datos_email :: Calendario -> Email -> Maybe Usuario
datos_email VacioC _ = Nothing
datos_email (Evento (Usuario u mail) _ calendario) m | mail == m = Just (Usuario u mail)
                                                     | otherwise = datos_email calendario m


-- EJERCICIO 3: Programe las siguientes funciones.

-- Dado un calendario y una actividad determinada, devuelve una lista de tuplas
-- de la forma (email, hora, día) correspondiente a cada usuarios que realizo
-- tal actividad.
es_act :: Actividad -> Tarea -> Bool
es_act Nada (Hacer _ _ Nada) = True
es_act Dormir (Hacer _ _ Dormir) = True
es_act Estudiar (Hacer _ _ Estudiar) = True
es_act Recreacion (Hacer _ _ Recreacion) = True
es_act _ _ = False

actividad :: Calendario -> Actividad -> [(Email, Hora, Dia)]
actividad VacioC _ = []
actividad (Evento (Usuario _ email) (Hacer hora dia act) calendario) a | (es_act a (Hacer hora dia act)) = (email,hora,dia) : ind
                                                                       | otherwise = ind
                                                                       where ind = actividad calendario a

-- Dada una lista de tareas y una actividad, cuenta la cantidad de tareas en las
-- que se debe hacer dicha actividad. No use recursión.

cant_act :: [Tarea] -> Actividad -> Int
cant_act xs a = length (filter (es_act a) xs)


-- EJERCICIO 4 (Estrella): Programe la siguiente función.

-- Dado un calendario y un email de usuario, devuelve una lista de los dias libre
-- de la semana que posee. Ayudas:
--    * Busque que hace la función \\ en Haskell.
--    * Aprovechar el hecho de que Dia es un tipo Enumerable.
dias_libres :: Calendario -> Email -> [Dia]
dias_libres VacioC _ = []
dias_libres (Evento (Usuario _ email) (Hacer hora dia act) calendario) m | (email == m) && not (es_act Estudiar (Hacer hora dia act)) = dia : ind
                                                                         | otherwise = ind
                                                                         where ind = dias_libres calendario m

-- EJEMPLOS PARA PRUEBAS
-- ===================

