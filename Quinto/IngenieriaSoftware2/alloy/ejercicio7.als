module musica

sig Interprete {}

sig Cancion {}

sig Catalogo {
	canciones: set Cancion,
	interpretes: set Interprete,
	interpretaciones: canciones -> interpretes
}{
	all x: canciones | some y: interpretes | (x -> y) in interpretaciones
	all x: interpretes | some y: canciones | (y -> x) in interpretaciones
}

-- A
pred agregar_entrada (cat_in, cat_out: Catalogo, can: Cancion, inter: Interprete) {
	-- (cat_in != cat_out) and not (can in cat_in.canciones) and not (inter in cat_in.interpretes) 
	cat_out.canciones = cat_in.canciones + can
	cat_out.interpretes = cat_in.interpretes + inter
	cat_out.interpretaciones = cat_in.interpretaciones + (can -> inter)
}

-- B
pred eliminar_entrada (cat_in, cat_out: Catalogo, can: Cancion, inter: Interprete) {
	-- cat_out != cat_in
	cat_out.interpretaciones = cat_in.interpretaciones - (can -> inter)
	cat_out.canciones = cat_in.canciones - (
		(cat_in.canciones - (
			(can <: (cat_in.interpretaciones - (can -> inter)).(cat_in.interpretes))
		)) & can
	)
	cat_out.interpretes = cat_in.interpretes - (
		(cat_in.interpretes - (
			(cat_in.canciones).((cat_in.interpretaciones - (can -> inter)) :> inter)
		)) & inter
	)
}

-- C
fun mismos_interpretes (cat: Catalogo) : (Interprete -> Interprete) {
	(~(cat.interpretaciones)).(cat.interpretaciones) - iden
}


pred mostrar_funcion (c: Catalogo, inter: (Interprete -> Interprete)) {
    inter = mismos_interpretes[c]
    some can: c.canciones | #(can.(c.interpretaciones))>2
}

run agregar_entrada
