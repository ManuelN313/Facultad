#include <stdlib.h>
#include <assert.h>
#include "stack.h"
 
struct _s_stack {
	stack_elem elem;
	struct _s_stack *next;
};

stack stack_empty() {
	return NULL;
}

stack stack_push(stack s, stack_elem e) {
	struct _s_stack *p = malloc(sizeof(struct _s_stack));
	p->elem = e;
	p->next = s;
	return s = p;
}

stack stack_pop(stack s) {
	assert(!stack_is_empty(s));
	struct _s_stack *p;
	p = s->next;
	free(s);
	return s = p;
}

unsigned int stack_size(stack s) {
	struct _s_stack *p = s;
	unsigned int length = 0u;
	while (p != NULL) {
		p = p->next;
		length++;
	}
	return length;
}

stack_elem stack_top(stack s) {
	assert(!stack_is_empty(s));
	return s->elem;
}

bool stack_is_empty(stack s) {
	return (s == NULL);
}

stack_elem *stack_to_array(stack s) {
	stack_elem *array = NULL;
	struct _s_stack *p = s;
	unsigned int i = 0u;
	array = (stack_elem*)calloc(stack_size(s), sizeof(stack_elem));
	while (p != NULL) {
		array[i] = p->elem;
		i++;
		p = p->next;
	}
	/* Forma mas fachera
	for (stack p = s; p != NULL; p = p->next) {
		array[i] = p->elem;
		i++;
	}
	
	*/
	
	return array;
}

stack stack_destroy(stack s) {
	struct _s_stack *p = s, *q;
	while (p != NULL) {
		q = p->next;
		free(p);
		p = q;
	}
	return NULL;
}
