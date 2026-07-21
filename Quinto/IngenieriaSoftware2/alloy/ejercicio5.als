module relacion_binarias

sig Elementos {}
sig RelacionBinaria {
	elementos: set Elementos,
	pares: elementos -> elementos
}

-- Propiedades
pred reflexiva (r: RelacionBinaria) {
	(iden & (r.elementos -> r.elementos)) in r.pares
}

pred transitiva (r: RelacionBinaria) {
	(r.pares).(r.pares) in r.pares
}

pred antisimetrica (r: RelacionBinaria) {
	(r.pares & ~(r.pares)) in iden
}

pred total (r: RelacionBinaria) {
	(r.pares + ~(r.pares)) = (r.elementos -> r.elementos)
}

pred asimetrica (r: RelacionBinaria) {
	r.pares in ~((r.elementos -> r.elementos) - r.pares)
}

-- A
pred preorden (r: RelacionBinaria) {
	reflexiva[r] and transitiva[r]
}

-- B
pred orden_parcial (r: RelacionBinaria) {
	reflexiva[r] and transitiva[r] and antisimetrica[r]
}

-- C
pred orden_total (r: RelacionBinaria) {
	reflexiva[r] and transitiva[r] and antisimetrica[r] and total[r]
}

-- D
pred orden_estricto (r: RelacionBinaria) {
	transitiva[r] and asimetrica[r]
}

-- E
pred tiene_minimo (r: RelacionBinaria) {
	one x: r.elementos | all y: r.elementos | (x -> y) in r.pares
}

pred tiene_minimo_aux (r: RelacionBinaria, min: Elementos) {
	one x: r.elementos | all y: r.elementos | (x -> y) in r.pares and min = x
}

-- F
pred tiene_maximo (r: RelacionBinaria) {
	one x: r.elementos | all y: r.elementos | (y -> x) in r.pares
}

pred tiene_maximo_aux (r: RelacionBinaria, max: Elementos) {
	one x: r.elementos | all y: r.elementos | (y -> x) in r.pares and max = x
}

-- Aserciones
assert parcial_implica_total {
	all r: RelacionBinaria | orden_parcial[r] implies orden_total[r] 
}
check parcial_implica_total for 5 but 1 RelacionBinaria

assert parcial_implica_minimo {
	all r: RelacionBinaria | orden_parcial[r] implies tiene_minimo[r]
}
check parcial_implica_minimo for 5 but 1 RelacionBinaria

assert orden_total_minimo_maximo {
	all r: RelacionBinaria | all x, y: Elementos | (orden_total[r] and tiene_minimo_aux[r, x] and tiene_maximo_aux[r, y]) implies x != y
}
check orden_total_minimo_maximo for 5 but 1 RelacionBinaria

assert union_estrictos {
	all r1, r2, r3: RelacionBinaria | (orden_estricto[r1] and orden_estricto[r2] and r3.pares = r1.pares + r2.pares) implies orden_estricto[r3]	
}
check union_estrictos for 5 but 3 RelacionBinaria

assert composicion_estrictos {
	all r1, r2, r3: RelacionBinaria | (orden_estricto[r1] and orden_estricto[r2] and r3.pares = (r1.pares).(r2.pares)) implies orden_estricto[r3]	
}
check composicion_estrictos for 5 but 3 RelacionBinaria


run orden_estricto for 5 but 1 RelacionBinaria
