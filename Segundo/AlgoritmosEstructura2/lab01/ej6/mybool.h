#ifndef _MYBOOL_H
#define _MYBOOL_H

#define true 1
#define false 0

typedef int mybool;

#endif

/*El error ocurre porque C no permite redifiniciones de typedef y lo que creo que pasa es que cada vez 
  accedemos a un .c o .h se vuelve a redifinir por lo que nos salta el error, la solucion es utilizar
  una guarda que pregunte si ya esta definido o no (#indef) */
