#ifndef _TUPLE_H
#define _TUPLE_H

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#include "APIG23.h"

/**
 * Estructura de tupla y funciones para manipularlas
*/

typedef struct tuple_st * tuple;

tuple tupleSet(u32 index, u32 color);

u32 tupleIndex(tuple t);

u32 tupleValue(tuple t);

tuple tupleDestroy(tuple t);

void tupleDump(tuple t);

#endif
