#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "list.h"

struct node {
	list_elem elem;
	struct node *next;
};

list empty(void) {
	list result = NULL;
	return result;
}

list addl(list_elem e, list l) {
	struct node *p = NULL;
	p = malloc(sizeof(struct node));
	p->elem = e;
	p->next = l;
	return l = p;
}

list destroy_list(list l) {
	struct node *p = l, *q = NULL;
	while (p != NULL) {
		q = p->next;
		free(p);
		p = q;
	}
	return l = NULL;
}

bool is_empty(list l) {
	return (l == NULL);
}

list_elem head(list l) {
	assert(l != NULL);
	return l->elem;	
}

list tail(list l) {
	assert(l != NULL);
	struct node *p = l;
	l = l->next;
	free(p);
	return l;
}

list addr(list_elem e, list l) {
	struct node *p = l, *q = NULL;
	q = malloc(sizeof(struct node));
	q->elem = e;
	q->next = NULL;
	if (!is_empty(l)) {
		while (p->next != NULL) {
			p = p->next;
		}
		p->next = q;
	} else {
		l = q;
	}
	return l;
}

unsigned int length_list(list l) {
	unsigned int length = 0u;
	struct node *p = l;
	while (p != NULL) {
		p = p->next;
		length++;
	}
	return length;
}

list concat(list l, list l0) {
	struct node *p = l, *q = NULL;
	if (p == NULL) {
		l = copy_list(l0);
	} else {
		while (p->next != NULL) {
			p = p->next;
		}
		q = copy_list(l0);
		p->next = q;
	}
	return l;
}

list_elem index(list l, unsigned int n) {
	assert(length_list(l) >= n && n >= 1);
	struct node *p = l;
	unsigned int i = 1u;
	while (i < n) {
		p = p->next;
		i++;
	}
	return p->elem;
}

list take(list l, unsigned int n) {
	struct node *p = l, *q = NULL;
	for (unsigned int i = 1u; i <= n-1; i++) {
		if (p != NULL) {
			p = p->next;
		}
	}
	if (p != NULL) {
		q = p;
		p = p->next;
		q->next = NULL;
	}
	while (p != NULL) {
		q = p;
		p = p->next;
		free(q);
	}
	return l;
}

list drop(list l, unsigned int n) {
	struct node *p = l, *q = l;
	unsigned int i = 1u;
	while (q != NULL && i <= n) {
		q = q->next;
		free(p);
		p = q;
		i++;
	}
	return l = q;
}

list copy_list(list l) {
	list l_copy = empty();
	struct node *p = NULL, *q = NULL;
	if (!is_empty(l)) {
		l_copy = malloc(sizeof(struct node));
		p = l;
		q = l_copy;
		while (p->next != NULL) {
			q->elem = p->elem;
			q->next = malloc(sizeof(struct node));
			q = q->next;
			p = p->next;
		}
		q->elem = p->elem;
		q->next = NULL;
	}
	return l_copy;
}

