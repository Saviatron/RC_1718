%
% balanceado(+A)
% Es cierto si para todo nodo, la diferencia de 
% alturas entre el subarbol izquierdo y el derecho
% difiere como máximo 1.
%

balanceado(nil).

balanceado(a(_, HI, HD)) :-
	balanceado(HI),
	balanceado(HD),
	altura(HI,RI),
	altura(HD,RD),
	R is RI - RD,
	R2 is abs(R),
	R2 < 2.

% altura(+A, -N)
% Es cierto cuando N unifica con la altura
% del árbol A.

altura(nil,0).

altura(a(_,HI,HD), R2) :-
	altura(HI,RI),
	altura(HD,RD),
	R is max(RI,RD),
	R2 is R + 1.