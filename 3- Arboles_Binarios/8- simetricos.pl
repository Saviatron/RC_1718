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

%QUICKMATHS!
% ?- arbol3(A), simetrico(A).
% A = a(1, a(2, a(3, nil, nil), nil), a(2, nil, a(3, nil, nil))).

% ?- arbol2(A), simetrico(A).
% false.

% ?- arbol4(A1), arbol5(A2), simetricos(A1,A2).
% A1 = a(1, a(2, a(3, nil, nil), nil), nil),
% A2 = a(1, nil, a(2, nil, a(3, nil, nil))).

% ?- arbol4(A1), arbol3(A2), simetricos(A1,A2).
% false.

arbol1(
	a(a, a(b, a(c, nil, nil), nil), a(d, nil, nil))
	).

arbol2(a(a,a(b,a(d,nil,nil),a(e,nil,nil)),a(c,nil,a(f,a(g,nil,nil),nil)))).

arbol3(
	a(1, a(2, a(3, nil, nil), nil), a(2, nil, a(3, nil, nil)))
	).

arbol4(
	a(1, a(2, a(3, nil, nil), nil), nil)
	).

arbol5(
	a(1, nil, a(2, nil, a(3, nil, nil)))
	).