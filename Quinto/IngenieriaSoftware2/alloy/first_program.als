module tour/addressBook1

sig Name, Addr {}
sig Book {
	addr: Name -> lone Addr
	}

pred show (b: Book) {
	#b.addr > 1
	#Name.(b.addr) > 1
}

pred add (b_i, b_o: Book, n: Name, a: Addr) {
	b_o.addr = b_i.addr + (n -> a)
}

pred showAdd (b_i, b_o: Book, n: Name, a: Addr) {
	add [b_i, b_o, n, a]
	#Name.(b_o.addr) > 1
}

pred del (b_i, b_o: Book, n: Name) {
	b_o.addr = b_i.addr - n -> Addr
}

fun lookup (b: Book, n: Name): set Addr {
	n.(b.addr)
}

assert delUndoesAdd {
	all b0,b1,b2: Book, n: Name, a: Addr |
	no n.(b0.addr) and add [b0,b1,n,a] and del [b1,b2,n] implies b0.addr = b2.addr
}


assert addIdempotent {
	all b0,b1,b2: Book, n: Name, a: Addr |
		 add [b0,b1,n,a] and add [b1,b2,n,a] implies b1.addr = b2.addr
}
assert addLocal {
all b0,b1: Book, n0,n1: Name, a: Addr |
		 add [b0,b1,n0,a] and n0 != n1
			 implies lookup [b0,n1] = lookup [b1,n1]
}


check delUndoesAdd for 10 but 3 Book
check addIdempotent for 3
check addLocal for 3 but 2 Book
run add for 3 but 2 Book
run show for 3 but 1 Book
run showAdd for 3 but 2 Book
