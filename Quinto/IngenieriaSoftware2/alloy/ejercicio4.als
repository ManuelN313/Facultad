module grafo_dirigido

sig Vertices {}
sig Grafo {
	vertices: set Vertices,
	aristas: vertices -> vertices	} 
	{
	iden in ((univ->univ) - aristas) -- Un vertice no puede tener una arista consigo mismo
	}

-- Operaciones Fundamentales
pred agregar_nodo (g: Grafo, v: Vertices) {
	g.vertices = g.vertices + v
}

pred eliminar_nodo (g: Grafo, v: Vertices) {
	g.vertices = g.vertices - v
}

pred agregar_arista (g: Grafo, v1, v2: Vertices) {
	v1 in g.vertices and v2 in g.vertices and v1 != v2
	g.aristas = g.aristas + (v1 -> v2)
}

pred eliminar_arista (g: Grafo, v1, v2: Vertices) {
	(v1 -> v2) in g.aristas
	g.aristas = g.aristas - (v1 -> v2)
}

-- A
pred aciclico (g: Grafo) {
	^(g.aristas) & iden = none -> none
}

-- B
pred no_dirigido (g: Grafo) {
	g.aristas = ~(g.aristas)
}

-- C
pred fuerte_conexo (g: Grafo) {
	(g.vertices -> g.vertices) in *(g.aristas)
}

-- D
pred conexo (g: Grafo) {
	(g.vertices -> g.vertices) in *(g.aristas + ~(g.aristas))
}

-- E:
pred tiene_comp_fuerte_conexa (g: Grafo) {
	some g1: Grafo | g1.vertices in g.vertices and g1.aristas in g.aristas and fuerte_conexo[g1] and g1.vertices != g.vertices and g1.aristas != (none -> none)
}

-- F:
pred tiene_comp_conexa (g: Grafo) {
	some g1: Grafo | g1.vertices in g.vertices and g1.aristas in g.aristas and conexo[g1] and g1.vertices != g.vertices and g1.aristas != (none -> none)
}

run tiene_comp_conexa for 5
