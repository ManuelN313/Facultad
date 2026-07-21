#ifndef _LIST_H
#define _LIST_H

typedef struct node * list;
typedef int list_elem;

#include <stdbool.h>

list empty(void);
/*
	Crea una lista vacia
*/

list addl(list_elem e, list l);
/*
	Agrega el elemento e al comienzo de la lista l 
*/

list destroy_list(list l);
/*
	Libera memoria en caso que sea necesario
*/

bool is_empty(list l);
/*
	Devuelve True si l es vacia
*/

list_elem head(list l);
/*
	Devuelve el primer elemento de la lista l
	PRE: not is_empty(l);
*/

list tail(list l);
/*
	Elimina el primer elemento de la lista l
*/

list addr(list_elem e, list l);
/*
	Agrega el elemento e al final de la lista l
*/

unsigned int length_list(list l);
/*
	Devuelve la cantidad de elementos de la lista l
*/

list concat(list l, list l0);
/*
	Agrega al final de l todos los elementos de l0 en el mismo orden sin modificar l0
*/

list_elem index(list l, unsigned int n);
/*
	Devuelve el n-esimo elemento de la lista l
	PRE: lenght_list(l) >= n >= 1
*/

list take(list l, unsigned int n);
/*
	Deja en l solo los primeros n elementos, eliminando el resto
*/

list drop(list l, unsigned int n);
/*
	Elimina los primeros n elementos de l
*/

list copy_list(list l);
/*
	Copia todos los elementos de l en una nueva lista m
*/

#endif
