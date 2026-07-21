#include <assert.h>
#include <stdlib.h>
#include <limits.h>

#include "cost.h"
#include "graph.h"
#include "mini_set.h"

static type_elem choose_c_minus (set c_mayus, cost_t *d, unsigned int length) { //returns the c_minus from c_mayus that is the min d[c_minus]
    cost_t min = INT_MAX;
    type_elem result = set_get(c_mayus);
    for (unsigned int i = 0u; i < length; ++i) {
        if (set_member((type_elem)i, c_mayus) && cost_lt(d[i], min)) {
            min = d[i];
            result = (type_elem)i;
        }
    }
    return result;
}

static cost_t* update_d (type_elem c_minus, set c_mayus, cost_t *d, unsigned int length, graph_t graph) {
    cost_t sum;
    for (unsigned int i = 0u; i < length; ++i) {
        if (set_member((type_elem)i, c_mayus)) {
            sum = cost_sum(d[c_minus], graph_get_cost(graph, c_minus, (vertex_t)i));
            if (cost_lt(sum, d[i])) {
                d[i] = sum;
            } 
        }
    }
    return d;
}

cost_t *dijkstra(graph_t graph, vertex_t init) {
    unsigned int length = graph_max_vertexs(graph);
    cost_t *d = malloc(length * sizeof(cost_t));
    type_elem c_minus;
    set c_mayus = set_empty();
    for (unsigned int i = 0u; i < length; ++i) {
        d[i] = graph_get_cost(graph, init, (vertex_t)i);
        c_mayus = set_add(c_mayus, (type_elem)i);
    }
    c_mayus = set_elim(c_mayus, (type_elem)init);
    while (!set_is_empty(c_mayus)) {
        c_minus = choose_c_minus(c_mayus, d, length);
        c_mayus = set_elim(c_mayus, c_minus);
        d = update_d(c_minus, c_mayus, d, length, graph);
    }
    c_mayus = set_destroy(c_mayus);
    return d;
}
