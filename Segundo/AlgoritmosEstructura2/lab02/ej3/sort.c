#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"


static unsigned int partition(int a[], unsigned int izq, unsigned int der) { 
	//Que una funcion o variable sea static significa que solo puede ser utilizada en el scope que fue definida, en este caso sort.c
    /* Permutes elements of a[izq..der] and returns pivot such that:
     - izq <= pivot <= der
     - elements in a[izq,pivot) all 'go_before' (according to function goes_before) a[pivot]
     - a[pivot] 'goes_before' all the elements in a(pivot,der]
    */
    unsigned int ppiv = izq, i = izq+1, j = der;
    while (i <= j) {
    	if (goes_before(a[i], a[ppiv])) {
    		i++;
    	} else if (goes_before(a[ppiv], a[j])) {
    		j--;
    	} else {
    		swap(a, i, j);
    	}
    
    }
    swap(a, ppiv, j);
    return ppiv = j;
}

static void quick_sort_rec(int a[], unsigned int izq, unsigned int der) {
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
    quick_sort_rec(a, 0, (length == 0) ? 0 : length - 1);
}

