
% cuenta_nodos(+A, -N) 
% es cierto cuando N unifica con el numero 
% de nodos del árbol A

cuenta_nodos(nil, 0).
cuenta_nodos(a(_, HI, HD), R) :-
	cuenta_nodos(HI, RI),
	cuenta_nodos(HD, RD),
	R is RI + RD + 1.

%QUICKMATHS!

%?- cuenta_nodos(a(a, nil, nil), R).
%R = 1.

%?- cuenta_nodos(a(a, a(b, nil, nil), nil), R).
%R = 2.

arbol(
	a(a, a(b, a(c, nil, nil), nil), a(d, nil, nil))
	).

%QUICKMATHS!
%?- arbol(A), cuenta_nodos(A,R).
%A = a(a, a(b, a(c, nil, nil), nil), a(d, nil, nil)),
%R = 4.