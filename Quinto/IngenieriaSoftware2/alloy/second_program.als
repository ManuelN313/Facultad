module tour/addressBook2
open util/ordering [Book]

abstract sig Target {}
sig Addr extends Target {}
abstract sig Name extends Target {}
sig Alias, Group extends Name {}
sig Book {
	names: set Name,
	addr: names -> some Target }
	{
	no n: Name | n in n.^(addr)
	all a: Alias | lone a.addr
	}

fact traces {
	init [first]
	all b: Book - last | let b_n = next [b] |
		some n: Name, t: Target | add [b, b_n, n, t] or del [b, b_n, n, t]
}

pred add (b0, b1: Book, n: Name, t: Target) {
	t in Addr or some lookup [b0,t]
	b1.addr = b0.addr + (n -> t)
}
pred del (b0, b1: Book, n: Name, t: Target) {
	no b0.addr.n or some n.(b0.addr) - t
	b1.addr = b0.addr - (n -> t)
}
pred init (b: Book) {no b.addr}
fun lookup (b: Book, n: Name): set Addr {n.^(b.addr) & Addr}

assert delUndoesAdd {
	all b0,b1,b2: Book, n: Name, t: Target |
		no n.(b0.addr) and add [b0,b1,n,t] and del [b1,b2,n, t] implies b0.addr = b2.addr
}
check delUndoesAdd for 3

assert addIdempotent {
	all b0,b1,b2: Book, n: Name, t: Target |
		add [b0,b1,n,t] and add [b1,b2,n,t] implies b1.addr = b2.addr
}
check addIdempotent for 3

assert addLocal {
	all b0,b1: Book, n0,n1: Name, t: Target |
		add [b0,b1,n0,t] and n0 != n1 implies lookup [b0,n1] = lookup [b1,n1]
}
check addLocal for 3 but 2 Book

assert lookupYields {
	all b: Book, n: b.names | some lookup [b,n]
}
check lookupYields for 6

pred show {}
run show for 4
