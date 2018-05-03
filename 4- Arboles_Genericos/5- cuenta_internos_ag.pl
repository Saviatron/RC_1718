:- ensure_loaded('4- cuenta_hojas_ag.pl').
:- ensure_loaded('1- cuenta_nodos_ag.pl').

% cuenta_internos_ag(+A, -N)
% Es cierto cuando N unifica con el número
% de nodos internos del arbol generico A

cuenta_internos_ag(A, R):-
	cuenta_hojas_ag(A,NH),
	cuenta_nodos_ag(A,NN),
	R is NN - NH.