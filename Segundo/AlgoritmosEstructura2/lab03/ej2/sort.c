/*
  @file sort.c
  @brief sort functions implementation
*/

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.h"
#include "sort.h"
#include "player.h"

bool goes_before(player_t x, player_t y){
    return (x.rank <= y.rank); //Importante que sea igual pues en el tenis puede ocurrir que dos o mas jugadores compartan el mismo puesto
}

bool array_is_sorted(player_t atp[], unsigned int length) {
    unsigned int i = 1u;
    while (i < length && goes_before(atp[i - 1u], atp[i])) {
        i++;
    }
    return (i == length);
}

void sort(player_t a[], unsigned int length) {
    insertion_sort(a, length);
}

void insert(player_t a[], unsigned int i) {
    unsigned int j = i;
    while (j > 0 && goes_before(a[j],a[j-1u])) {
    	swap(a, j-1, j);
    	j--;
    }
}

void insertion_sort(player_t a[], unsigned int length) {
    for (unsigned int i = 1u; i < length; ++i) {
        insert(a, i);
    }
}

void swap(player_t a[], unsigned int x, unsigned int y) {
	player_t aux = a[x];
	a[x] = a[y];
	a[y] = aux;

}




