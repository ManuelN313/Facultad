#include <assert.h>
#include <stdbool.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"


static void quick_sort_rec(int a[], unsigned int izq, unsigned int der) {
 /* needs implementation */
	unsigned int ppiv;
	if (izq < der) {
		ppiv = partition(a, izq, der);
		quick_sort_rec(a, izq, (ppiv == 0) ? ppiv : ppiv - 1u); 
		//Si ppiv == 0 entonces cuando haga la resta me va a dar el mayor entero positivo (2**64)-1, 
		//pues ppvi es un unsigned int y voy a estar accediendo pocisiones de mi array que no deberia
		quick_sort_rec(a, ppiv + 1u, der);
	}
}

void quick_sort(int a[], unsigned int length) {
    quick_sort_rec(a, 0u, (length == 0u) ? 0u : length - 1u);
}

