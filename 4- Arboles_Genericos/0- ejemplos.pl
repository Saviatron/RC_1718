:- ensure_loaded('2- crea_arbolg.pl').

arbol1(
	a(1,[a(2,[a(3,[])]),a(4,[]),a(5,[a(6,[]),a(7,[])])])
	).


arbol2(
	a(1,[a(2,[a(3,[a(4,[])])]), a(5,[a(6,[a(7,[a(8,[a(9,[])])])])])])
	).

arbol3(
	a(3,[a(4,[a(1,[])]),a(4,[]),a(7,[a(2,[]),a(6,[])])])
	).