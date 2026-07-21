#include <stdlib.h>
#include <assert.h>
#include "stack.h"

struct _s_stack {
    stack_elem *elems;      // Arreglo de elementos
    unsigned int size;      // Cantidad de elementos en la pila
    unsigned int capacity;  // Capacidad actual del arreglo elems
};

static bool invrep(stack s);

static bool invrep(stack s) {
	return (s != NULL) &&  (s->size <= s->capacity) && (s->elems != NULL || s->size == 0);
}

stack stack_empty() {
	stack s = malloc(sizeof(struct _s_stack));
	s->elems = NULL;
	s->size = 0u;
	s->capacity = 0u;
	assert(invrep(s));
	return s;
}

stack stack_push(stack s, stack_elem e) {
	assert(invrep(s));
	if (s->size == 0u) {
		s->elems = realloc(s->elems, sizeof(stack_elem));
		s->capacity = 1u;
	} else if (s->size == s->capacity) { 
		s->capacity = s->capacity * 2;
		s->elems = realloc(s->elems,((stack_elem) s->capacity) * sizeof(stack_elem));
	} 
	s->elems[s->size] = e;
	s->size++;
	assert(invrep(s));
	return s;
}


stack stack_pop(stack s) {
	assert(invrep(s));
	assert(!stack_is_empty(s));
	s->size--;
	assert(invrep(s));
	return s;
}

unsigned int stack_size(stack s) {
	assert(invrep(s));
	return s->size;
}

stack_elem stack_top(stack s) {
	assert(invrep(s));
	assert(!stack_is_empty(s));
	return s->elems[s->size-1];
}

bool stack_is_empty(stack s) {
	assert(invrep(s));
	return (s->size == 0u);	
}

stack_elem *stack_to_array(stack s) {
	assert(invrep(s));
	stack_elem *array = NULL;
	array = malloc(s->size * sizeof(stack_elem));
	for (unsigned int i = 0u; i < s->size; i++) {
		array[i] = s->elems[s->size-(i+1)];
	}
	assert(invrep(s));
	return array;
}

stack stack_destroy(stack s) { 
	assert(invrep(s));
	free(s->elems);
	s->elems = NULL; //Es de correcta practica hacer esto
	free(s);
	return s = NULL;
}


