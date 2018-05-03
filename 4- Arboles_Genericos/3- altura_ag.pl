:- include('0- ejemplos.pl').

% altura_ag(+A, -R)
% Es cierto cuando R unifica con la 
% altura del arbol generico A.

altura_ag(a(_,Lista_hijos), R) :-
	altura_ag(Lista_hijos, RL),
	R is RL + 1.

altura_ag([], 0).

altura_ag([Cab|Resto], R) :-
	altura_ag(Resto, RResto),
	altura_ag(Cab,RCab),
	R is max(RCab, RResto).
