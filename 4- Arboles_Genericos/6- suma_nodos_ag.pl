:- ensure_loaded('0- ejemplos.pl').

% suma_nodos_ag(+A, -R)
% Es cierto cuando R unifica con la suma
% de todas las etiquetas del arbol A

suma_nodos_ag(a(E,Lista_Hijos), R2):-
	suma_nodos_ag(Lista_Hijos, R),
	R2 is R + E.

suma_nodos_ag([],0).

suma_nodos_ag([Ca|Resto], R):-
	suma_nodos_ag(Ca, RCa),
	suma_nodos_ag(Resto, RResto),
	R is RCa + RResto.