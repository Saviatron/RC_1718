% cuenta_hojas(+Arbol_binario, ?Lista_hojas)
% 
% es cierto cuando Lista_hojas unifica con una 
% lista que contiene las etiquetas de las hojas del árbol “Arbol_binario”

cuenta_hojas(nil, 0).
cuenta_hojas(a(E, nil, nil), 1).

cuenta_hojas(a(_, nil, HD),  RD) :-
	HD \= nil,
	cuenta_hojas(HD, RD).

cuenta_hojas(a(_, HI, nil),  RI) :-
	HI \= nil,
	cuenta_hojas(HI, RI).

cuenta_hojas(a(_, HI, HD),  R) :-
	HD \= nil, HI \= nil,
	cuenta_hojas(HI, RI),
	cuenta_hojas(HD, RD),
	R is RI + RD.

arbol1(
	a(a, a(b, a(c, nil, nil), nil), a(d, nil, nil))
	).

arbol2(a(a,a(b,a(d,nil,nil),a(e,nil,nil)),a(c,nil,a(f,a(g,nil,nil),nil)))).