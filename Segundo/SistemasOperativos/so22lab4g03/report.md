# Laboratorio 4: BigBrother FS
## Sistemas Operativos 2022 - FaMAF - UNC
### Integrantes
- Ignacio Facello,&emsp;ignacio.facello@mi.unc.edu.ar
- Lara Kurtz, &emsp;lara.kurtz@mi.unc.edu.ar
- Manuel Nieto,&emsp;manuel.nieto@mi.unc.edu.ar
- Lautaro Rodriguez,&emsp;lautaro.rodriguez@mi.unc.edu.ar

1. *Cuando se ejecuta el main con la opción -d, ¿qué se está mostrando en la pantalla?*  
En pantalla se muestran los prints generados por la macro DEBUG. Principalmente se pueden observar las llamadas al sistema y como se redirigen al código de `fuse`.

2. *¿Hay alguna manera de saber el nombre del archivo guardado en el cluster 157?*  
No podemos saberlo mirando solo el cluster ya que el nombre del archivo se encuentra en la direntry de su padre, el cual contiene una lista con todo los contenidos del directorio y el primer cluster de la cadena de cada uno. La FAT nos dice, para cada elemento de la cadena, cuál es el próximo, pero no contiene información sobre los elementos anteriores. Particularmente no podemos saber qué direntry nos llevó hasta el comienzo de la cadena.

3. *¿Dónde se guardan las entradas de directorio? ¿Cuántos archivos puede tener adentro un directorio en FAT32?*  
Las entradas de directorio se guardan en el cluster del directorio padre. La cantidad de archivos está determinada por la cantidad de entradas de directorio que puede almacenar un cluster y la cantidad de clusters que le permitimos usar a cada directorio; en el caso de FAT32, con un cluster de 512 bytes, podemos almacenar 512/32 = 16 archivos por cluster. Para la implementacion en FUSE, cada directorio solo puede estar compuesto de un cluster por lo tanto el maximo es 16 archivos por directorio.

4. *Cuando se ejecuta el comando como ls -l, el sistema operativo, ¿llama a algún programa de usuario? ¿A alguna llamada al sistema? ¿Cómo se conecta esto con FUSE? ¿Qué funciones de su código se ejecutan finalmente?*  
El comando ls llama al programa del mismo nombre (creo). Luego dicho programa llama a las sycalls `OPENDIR`, `READDIR`, `GETATTR`, entre otras. Estas llamadas interactuan con el filesystem del SO y luego pasa a FUSE, que las intercepta y en base a nuestro codigo las redirecciona hacia `fat_fuse_opendir`, `fat_fuse_readdir`, `fat_fuse_getattr`, las cuales son las que terminan siendo ejecutadas.

5. *¿Por qué tienen que escribir las entradas de directorio manualmente pero no tienen que guardar la tabla FAT cada vez que la modifican?*
Escribimos las entradas a disco pues estas no se encuentran en memoria. Mientras que la tabla FAT, una lista linkeada, se encuentra en memoria pues su objetivo es reducir el tiempo de busqueda de los clusters de archivos/directorios.

6. *Para los sistemas de archivos FAT32, la tabla FAT, ¿siempre tiene el mismo tamaño? En caso de que sí, ¿qué tamaño tiene?*  
La tabla FAT se crea al momento de formateo de la imagen y la cantidad de entradas depende de la cantidad de clusters que haya en el área de datos, la cual a su vez depende del tamaño de cluster y de disco. La estructura de la FAT no se modifica, solo se modifican sus contenidos, por lo que para una misma imagen el tamaño de la FAT se preserva (si no se la vuelve a formatear).