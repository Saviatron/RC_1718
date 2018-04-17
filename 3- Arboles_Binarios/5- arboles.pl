
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

arbol1(
	a(a, a(b, a(c, nil, nil), nil), a(d, nil, nil))
	).

arbol2(a(a,a(b,a(d,nil,nil),a(e,nil,nil)),a(c,nil,a(f,a(g,nil,nil),nil)))).


%QUICKMATHS!
%?- arbol1(A), cuenta_nodos(A,R).
%A = a(a, a(b, a(c, nil, nil), nil), a(d, nil, nil)),
%R = 4.

% lista_hojas(+Arbol_binario, ?Lista_hojas)
% 
% es cierto cuando Lista_hojas unifica con una 
% lista que contiene las etiquetas de las hojas del árbol “Arbol_binario”

lista_hojas(nil, []).
lista_hojas(a(E, nil, nil), [E]).

lista_hojas(a(_, nil, HD),  RD) :-
	HD \= nil,
	lista_hojas(HD, RD).

lista_hojas(a(_, HI, nil),  RI) :-
	HI \= nil,
	lista_hojas(HI, RI).

lista_hojas(a(_, HI, HD),  R) :-
	HD \= nil, HI \= nil,
	lista_hojas(HI, RI),
	lista_hojas(HD, RD),
	append(RI, RD, R).

% cuenta_hojas(+A, -R).
% Es cierto cuando R unifica con el numero
% de hojas del arbol A 

cuenta_hojas(A, R2) :-
	lista_hojas(A, R),
	length(R, R2).

% cuenta_internos(+A, -R).
% Es cierto cuando R unifica con el numero
% de nodos internos del arbol A (todos los nodos
% menos las hojas)

cuenta_internos(A, R) :-
	cuenta_nodos(A, NumNodos),
	cuenta_hojas(A, NumHojas),
	R is NumNodos - NumHojas.

% No hay caso base, porque no hay recursividad, solo usamos otros predicados que si tienen caso base

% suma_nodos(+A, -R)
% Es cierto cuando R unifica con la suma
% de todas las etiquetas del arbol A

suma_nodos(nil, 0).

suma_nodos(a(E, HI, HD), R) :-
	suma_nodos(HI, RI),
	suma_nodos(HD, RD),
	R is E + RI + RD.

arbol3(
	a(1, a(4, a(5, nil, nil), nil), a(2, nil, nil))
	).