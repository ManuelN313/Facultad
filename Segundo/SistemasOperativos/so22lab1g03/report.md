# **Sistemas Operativos 2022**
## Informe del Laboratorio 1: _My Bash_
#### Integrantes:
- Ignacio Facello ignacio.facello@mi.unc.edu.ar             
- Lara Kurtz lara.kurtz@mi.unc.edu.ar
- Manuel Nieto manuel.nieto@mi.unc.edu.ar
- Lautaro Rodriguez lautaro.rodriguez@mi.unc.edu.ar

### Introducción
El objetivo de este proyecto es programar con **C** una **shell** al estilo de bash **(Bourne Again SHell)** en **Linux**. Llamaremos a la shell **mybash** y queremos que tenga un comportamiento lo más idéntico posible a la terminal utilizada en el laboratorio 0. Para ello buscaremos que mybash tenga las siguientes funcionalidades:
- Ejecución de comandos en modo foreground y background
- Redirección de entrada y salida estándar
- Pipes con cantidad arbitraria de comandos
- Ejecución de comandos internos
- Salida exitosa sin procesos _zombies_
- Implementación de un _prompt_ con información relevante

### Instrucciones para correr *mybash*
Basta con clonar el repositorio y ejecutar los siguientes comandos:
```bash
make 
./mybash
```
Para correr los tests, basta con ejecutar los siguientes comandos:

```
make test
make memtest
```

### Explicación General
*mybash* se encuentra divido en mútiples módulos, entre los cuales están:
	- **builtin**: Ejecuta los **comandos internos** cd, help y exit.
	- **command**: Ubicación del TAD scommand y el TAD pipeline, los cuales permiten representar cómodamente la información que el usuario le escribe a mybash.
	- **execute**: Ejecuta los comandos simples y pipelines de largo arbitrario. En caso de ser un comando interno, lo redirecciona a builtin.
	- **mybash**: Módulo principal del proyecto, recibe la entrada dada por el usuario.
	- **parsing**: Verifica que la entrada del usuario sea correcta con ayuda del módulo paser y carga esta entrada en una variable del TAD pipeline.

La **idea general** es que mybash recibe una entrada la cual es enviada a parsing para ser verificada y una vez procesada es devuelta en una variable del TAD pipeline. Luego mybash llama a execute para que se encargue de la ejecución. execute ejecutará comandos simples o pipelines, los cuales pueden tener redirecciones tanto de entrada como salida. Puede ocurrir que un comando simple sea interno en cual caso _execute_ llamará a builtin para que se encargue. Una vez terminada la ejecución se vuelve a mybash quien espera la próxima entrada del usuario.

### Desarrollo
#### builtin
El módulo builtin implementa comandos internos, es decir, comandos que no necesitan de llamadas a *fork()* ni *execvp()* para su ejecución. Estos son:

- **cd (change directory)**: el cambio de directorio se logra mediante una llamada
a la *system call chdir()*. Acepta comandos relativos y absolutos. Al igual 
que en *bash,* de no proveerle argumentos, se cambia al directorio *home.*
- **help**: imprime información general sobre *mybash*.
- **exit**: termina la ejecución de *mybash*. Se logra una *salida limpia* mediante
el manejo de señales en el módulo execute, y un correcto manejo de memoria 
en los módulos en general.

Para que agregar nuevos comandos internos al módulo no requiera modificar demasiado el código, se definen un arreglo el cual lista todos los comandos internos implementados, una constante para cada uno de los comandos que contiene información sobre ellos y se modulariza su ejecución en una función para cada uno de ellos. 

#### command
Nuestra implementación del módulo command.c se basa en el tipo [**Gqueue**](https://docs.gtk.org/glib/struct.Queue.html) perteneciente a la libreria **Glib**. 

**(SCOMMAND)**

Para el TAD **scommand** utilizamos una estructura compuesta por una _gqueue_, en la que se guarda el comando a ejecutar, y dos _char*_, en los que se alojan los archivos de redirección (pudiendo no haber ninguno). Implementamos las siguientes funciones que nos permiten interactuar con el comando simple:

- ``scommand_new()``: Crea un scommand 
- ``scommand_destroy()``: Destruye un scommand
- ``scommand_push_back()``: Agrega un elemento por detrás
- ``scommand_pop_front()``: Remueve el primer elemento
- ``scommand_set_redir_in()``: Setea el archivo de redirección de entrada
- ``scommand_set_redir_out()``: Setea el archivo de redirección de salida
- ``scommand_is_empty()``: Revisa si el scommand está vacío
- ``scommand_length()``: Obtiene el largo del scommand
- ``scommand_front()``: Obtiene el primer elemento
- ``scommand_get_redir_in()``: Obtiene el archivo de redirección de entrada
- ``scommand_get_redir_out()``: Obtiene el archivo de redirección de salida
- ``scommand_to_string()``: Construye un string con los contenidos de la scommand

En algunas de estas implementaciones tuvimos problemas de _memory leaks_, principalmente en scommand_to_string(). En dicha función el problema se debía a que llamábamos múltiples veces a strmerge(s1, s2) sobre el mismo puntero (esta función reserva memoria para guardar el resultado de concatenar _s1_ y _s2_). Al sobreescribirlo, perdíamos acceso a la memoria a la cual apuntaba previamente y por lo tanto no podíamos liberarla. Lo solucionamos guardando el puntero en uno auxiliar y liberándolo después de sobreescribir el original. Decidimos crear una función auxiliar llamada strmerge_free() para modularizar este comportamiento, ya que debebíamos utilizarlo muchas veces dentro de scommand_to_string().

Para el TAD **pipeline** utilizamos una estructura compuesta por una _gqueue_ de scommand (la pipeline) y un booleano que determina si debe o no esperar a los procesos hijos. Implementamos las siguientes funciones que nos permiten interactuar con la pipeline:

- ``pipeline_new()``: Crea de pipeline 
- ``pipeline_destroy()``: Destruye de pipeline
- ``pipeline_push_back()``: Agrega un elemento por detrás
- ``pipeline_pop_front()``: Remueve el primer elemento
- ``pipeline_set_wait()``: Cambia modo de espera
- ``pipeline_is_empty()``: Revisa si esta vacía la pipeline
- ``pipeline_length()``: Obtiene el largo de la pipeline
- ``pipeline_front()``: Obtiene primer elemento
- ``pipeline_get_wait()``: Obtiene modo de espera
- ``pipeline_to_string()``: Construye un string con los contenidos de la pipeline

Hubieron varios problemas con la implementación, principalmente leaks de memoria que se resolvieron rápidamente. El más importante fue generado por ``pipeline_to_string()`` ya que la función ``strdup()`` asigna memoria por cada string duplicado y luego debe ser liberado.

#### parsing
El módulo '*parsing.c*' utiliza las funciones de '*parser.c*' para construir, a partir de un input de texto, una pipeline que luego podemos utilizar en 'execute.c'.
Definimos solo dos funciones: ``parse_command`` y ``parse_pipeline``.

``parse_command`` se encarga de formar un scommand a partir de una cadena de strings del input. La idea es simple, llamamos a la función `parser_next_argument()` repetidamente, categorizando el output de la función en "comando", "redirección de entrada" y "redirección de salida". El proceso continúa hasta que next_argument devuelve `NULL`, en cuyo caso sabemos que encontramos un caracter `|`, `&` o `\n` y salimos de la función, devolviendo el scommand armado.

Luego tenemos la función ``parse_pipeline``, que arma una pipeline a partir de varios scommand discretos. Esta función no analiza la entrada de texto directamente sino que utiliza varias llamada secuenciales a `parse_command` y la suposición de que la única entrada válida va a tomar la forma de "comando1 | comando2 | . . . | comando n ( & opcionalmente )" para ensamblar la pipeline de modo que obtenemos un tad `{{scommand1,scommand2 ..., scommand n},Boolean}`.
 
#### execute
Se realizó una implementación que permite ejecutar **pipelines de largo arbitrario (con o sin redirecciones)**. Buscando imitar el comportamientode *bash*, los operadores \>/< (redirecciones) tienen precedencia sobre el operador | (*pipe*). Asimismo, *bash* permite sólo una redirección por “file destriptor”, por lo que de proveerse más de uno, el único que realmente se ejecuta es el último. Este comportamiendo también está presente en *mybash*.

Se implementaron por separado la ejecución de un único comando o una pipeline que contiene varios. En el segundo caso la *shell* (proceso padre) separa la pipeline en tres porciones separadas (*primer comando*, *medio* y *último comando*). Dentro de execute.c tenemos una función estática llamada execute_command(), que toma una pipeline, dos listas de *file descriptors* (pipes de lectura y escritura) y un **selector**. Al ser llamada extrae el comando frontal de la pipeline, decide si se debe encargar builtin, y si no, realiza un fork. Una vez en el proceso hijo el selector determina que file descriptors debe cerrar y con cuales reemplazar *stdin/stdout*. Luego realizamos el redireccionamiento interno del comando, el orden es importante ya que si redireccionamos internamente primero y luego asignamos las pipes estas últimas sobrescriben a las anteriores y el comportamiento obtenido no es el deseado (el redireccionamiento de pipe se prioriza sobre el interno). Finalmente ejecutamos el comando mediante _execvp()_.
Si el comando es inválido o la ejecución falla por alguna razón, imprimimos un mensaje de error y terminamos la ejecución del hijo, el padre no se ve afectado por un comando erróneo.

Finalmente, la ejecución en primer y segundo plano (*foreground/background*) se consigue haciendo que el padre del proceso llame a *waitpid(-1)* tantas veces como comandos haya, de ser especificado el operador &.

###### Manejo de procesos zombies:
Para cada proceso se crea una línea en la **tabla de procesos** que provee información sobre el mismo, como su **pid** y **estado**. Cuando un proceso termina su ejecución, le envía una señal al proceso padre, quién luego de recibirla elimina al hijo de dicha tabla. Esto sucede siempre y cuando el padre **se haya quedado esperando a recibir la señal** (mediante *wait()*). En el caso de que el padre no haya realizado una llamada a *wait(),* lo cual sucede cuando ejecutamos procesos en **segundo plano** (con el operador &) **este nunca recibirá la señal de que el hijo terminó de ejecutarse**. Por lo tanto no será removido de la tabla de procesos y quedará en lo que se conoce como **estado zombie** hasta la terminación del proceso padre. De esto surge un potencial problema que se debe a que **la tabla de procesos es finita**. Si existieran suficientes procesos zombies, la tabla podría llenarse y no permitir que se creen nuevos procesos. Para evitar esto, incluímos la siguiente llamada en la función *execute()*:

```c
#include <signal.h>
signal(SIGCHLD, SIG_IGN);
```
que encarga al kernel de eliminar de la tabla a todo proceso hijo que termine su ejecución, incluso si el padre no llama a *wait()*.

#### mybash
La implementación de este módulo es bastante simple, ya que consiste de unas pocas llamadas a funciones de los módulos antes detallados. Como **punto estrella** se modifica el *prompt* para que muestre la siguiente información relevante:
- Shell
- Usuario
- Hostname
- Directorio actual

### Tecnicas de Programación
Hemos utilizado las siguientes técnicas:
- Unit Testings: Las pruebas unitarias son una forma efectiva de comprobar el funcionamiento exhaustivo de los módulos individuales. Sirve para asegurar que cada módulo funcione correcta y eficientemente por separado.
- Correcto manejo de memoria dinámica: A lo largo del proyecto utilizamos memoria dinámica para la creación de variables por lo que es de vital importancia hacer una correcta asignación y liberación de la memoria. Utilizando lo aprendido en materias anteriores. 

### Herramientas de Programación
Para realizar este proyecto utilizamos varias herramientas las cuales nos permitieron trabajar de manera más efectiva, segura y organizada:
- **Git**: Programa de control de versiones para proyectos con un gran número de archivos y múltiples integrantes. Es muy utilizado debido a su eficiencia, confiabilidad y compatibilidad de mantenimiento. 
- **Bitbucket**: Servicio de alojamiento basado en web, para los proyectos que utilizan el sistema de control de versiones Git.
- **Visual Studio Code**: Editor de código fuente que incluye control integrado de _Git_, resaltado de sintáxis, control de errores de código y manejo sencillo de múltiples archivos en un solo directorio, entre algunas de sus funcionalidades de gran utilidad.
- **MakeFile**: Herramienta de automatización utilizada para las labores de creación de ejecutables y limpieza de los archivos temporales. Facilitó la compilación del programa y los Unit Testings.
- **GDB**: Debugger estándar para el compilador GCC. Es un depurador portable que funciona para C, el cual nos permitió solucionar errores de comportamiento no deseado en nuestro código.
- **Valgrind**: Conjunto de herramientas que ayuda en la depuración de problemas de memoria y rendimiento. Nos ayudo a solucionar problemas respecto a la asignación y liberación de memoria dinámica.

### Conclusiones
Gracias a este laboratorio empezamos a familiarizarnos con nuevas herramientas como _Git_, las cuales serán de gran utilidad para el mundo laboral y próximos proyectos. Adquirimos nuevas técnicas/prácticas de programación como las pruebas unitarias, las cuales nos permitieron verificar la funcionalidad de nuestros módulos eficientemente. Respecto de la temática del proyecto, nos permitió involucrarnos un poco más con el sistema operativo y aprender sobre la estructura interna de procesos básicos.
