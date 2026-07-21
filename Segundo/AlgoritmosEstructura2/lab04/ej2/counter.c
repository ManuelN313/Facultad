#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>

#include "counter.h"

struct _counter {
    unsigned int count;
};

counter counter_init(void) {
	counter result = NULL;
	result = malloc(sizeof(unsigned int));
	result->count = 0u;
	return result;
}

void counter_inc(counter c) {
	assert(c != NULL);
	c->count = c->count+1;
}

bool counter_is_init(counter c) {
	assert(c != NULL);
	return (c->count == 0u);
}

void counter_dec(counter c) {
	assert(!counter_is_init(c));
	c->count = c->count-1;
}

counter counter_copy(counter c) {
	counter d = NULL;
	if (c != NULL) {
		d = malloc(sizeof(unsigned int));
		d->count = c->count;
	}
	return d;
}

void counter_destroy(counter c) {
	if (c != NULL) {
		free(c);
		c = NULL;	
	}
}

