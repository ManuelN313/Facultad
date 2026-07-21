module aeropuertos

sig VueloID, Ciudad, Horario {}

sig Aerolinea {
	nrovuelos: set VueloID,
	rutadirecta: nrovuelos -> Ciudad -> Ciudad,
	partidas: nrovuelos -> Horario,
	arribos: nrovuelos -> Horario
}

fact unica_ruta {
	all a: Aerolinea | all n: a.nrovuelos | one c1, c2: Ciudad | (n -> c1 -> c2) in a.rutadirecta
}

fact origen_distinto_de_destino {
	all a: Aerolinea | all n: a.nrovuelos | all c1, c2: Ciudad | (n -> c1 -> c2) in a.rutadirecta implies c1 != c2
}

fact unico_partida {
	all a: Aerolinea | all n: a.nrovuelos | (all p1, p2: Horario | ((n -> p1) in a.partidas and (n -> p2) in a.partidas) implies p1 = p2) and some h: Horario | (n -> h) in a.partidas
}

fact unico_arribo {
	all a: Aerolinea | all n: a.nrovuelos | (all a1, a2: Horario | ((n -> a1) in a.arribos and (n -> a2) in a.arribos) implies a1 = a2) and some h: Horario | (n -> h) in a.arribos
}

fact global_unico {
	all a1, a2: Aerolinea | all v: VueloID | (v in a1.nrovuelos and v in a2.nrovuelos) implies a1 = a2
}

pred hay_ruta (a: Aerolinea, c_p, c_a: Ciudad) {
	c_p != c_a
	let rutas = (a.nrovuelos).(a.rutadirecta) |
	(c_p -> c_a) in (^rutas)
}

run hay_ruta for 5 but 1 Aerolinea

