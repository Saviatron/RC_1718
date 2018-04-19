%
% crea_abb(+L, -A)
% Es cierto cuando A unifica con un arbol binario
% de busqueda balanceado que contiene todas las 
% etiquetas de la lista L. Consideraremos que la
% lista está ordenada.
%

crea_abb([], nil).

crea_abb(L, a(Cab, R1, R2)) :-
	length(L,N),
	N2 is N div 2, 
	length(L1, N2),
	append(L1, [Cab|L2], L),
	crea_abb(L1, R1),
	crea_abb(L2, R2).

%QUICKMATHS!

% ?- crea_abb([1,2,3,4,5], Abb).
% Abb = a(3, a(2, a(1, nil, nil), nil), a(5, a(4, nil, nil), nil)) .

% ?- crea_abb([1,2,3,4,5,6,7], Abb).
% Abb = a(4, a(2, a(1, nil, nil), a(3, nil, nil)), a(6, a(5, nil, nil), a(7, nil, nil))) ;

% ?- crea_abb([1,2,3], Abb).
% Abb = a(2, a(1, nil, nil), a(3, nil, nil)) .

% ?- crea_abb([1,2], Abb).
% Abb = a(2, a(1, nil, nil), nil) .

% ?- crea_abb([1], Abb).
% Abb = a(1, nil, nil) .

% ?- crea_abb([], Abb).
% Abb = nil 