% simetricos(+A,+B)
% Es cierto si los arboles A y B son simetricos
%      1  .  1
%     /   .   \
%    2    .    2

simetricos(A,B) :-
	invertir(A,B).

% simetrico(+A)
% Es cierto si el arbol A es simetrico
% respecto al eje central.
%      1   .   1
%     / \  .  / \
%    2   2 . 2   2

simetrico(A):-
	invertir(A,A).

% invertir(+A,-R)
% Es cierto si R es el arbol A invertido.
% Para todo nodo, lo que en A está a la izquierda
% en R aparece a la derecha.
%      1  .  1
%     /   .   \
%    2    .    2

invertir(nil, nil).

invertir(a(E,HI,HD), a(E,RD,RI)) :-
	invertir(HI, RI),
	invertir(HD, RD).


arbol1(
	a(a, a(b, a(c, nil, nil), nil), a(d, nil, nil))
	).

arbol2(a(a,a(b,a(d,nil,nil),a(e,nil,nil)),a(c,nil,a(f,a(g,nil,nil),nil)))).

arbol3(
	a(1, a(2, a(3, nil, nil), nil), a(2, nil, a(3, nil, nil)))
	).