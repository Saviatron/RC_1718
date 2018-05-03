:- ensure_loaded('0- ejemplos.pl').

% cuenta_nodos(+A,-N)
% Es cierto cuando N unifica
% con el numero de nodos del arbol A

cuenta_nodos_ag(a(_,Lista_hijos), R):-
	cuenta_nodos_ag(Lista_hijos, RL),
	R is RL + 1.

cuenta_nodos_ag([], 0).

cuenta_nodos_ag([Cab|Resto], R):-
	cuenta_nodos_ag(Cab,RCab),
	cuenta_nodos_ag(Resto,RResto),
	R is RCab + RResto.
