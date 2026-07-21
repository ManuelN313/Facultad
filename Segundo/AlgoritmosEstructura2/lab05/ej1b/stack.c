#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include "stack.h"

struct _s_stack {
	stack_elem elem;
	struct _s_stack *next;
};

struct _stack {
	struct _s_stack *fst; //Points to the top element of the stack
	unsigned int size;
};

static bool invrep (stack s); 

static bool invrep (stack s) {
	return (s != NULL) && ((s->fst == NULL && s->size == 0) || (s->fst != NULL && s->size != 0));
}


stack stack_empty() {
	stack s = malloc(sizeof(struct _stack));
	s->fst = NULL;
	s->size = 0u;
	assert(invrep(s));
	return s;
}

stack stack_push(stack s, stack_elem e) {
	assert(invrep(s));
	struct _s_stack *p = malloc(sizeof(struct _s_stack));
	p->elem = e;
	p->next = s->fst;
	s->fst = p;
	s->size++;
	assert(invrep(s));
	return s;
}

stack stack_pop(stack s) {
	assert(invrep(s));
	assert(!stack_is_empty(s));
	struct _s_stack *p = (s->fst)->next;
	free(s->fst);
	s->fst = p;
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
	return (s->fst)->elem;
}

bool stack_is_empty(stack s) {
	assert(invrep(s));
	return (s->size == 0u);
}

stack_elem *stack_to_array(stack s) {
	assert(invrep(s));
	stack_elem *array = NULL;
	struct _s_stack *p = s->fst;
	unsigned int i = 0u;
	array = (stack_elem*)calloc(stack_size(s), sizeof(stack_elem));
	while (p != NULL) {
		array[i] = p->elem;
		i++;
		p = p->next;
	}
	assert(invrep(s));
	return array;
}

stack stack_destroy(stack s) {
	assert(invrep(s));
	struct _s_stack *p = s->fst, *q;
	while (p != NULL) {
		q = p->next;
		free(p);
		p = q;
	}
	free(s);
	return s = NULL;
}
