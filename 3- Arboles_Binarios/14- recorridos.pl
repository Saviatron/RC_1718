% inorden(+A,-R)
% Es cierto cuando 
% en inorden del arbol A
% HI, Raiz, HD

inorden(nil, []).
inorden(a(E,HI,HD), R):-
	inorden(HI,RI),
	inorden(HD, RD),
	append(RI, [E|RD], R).

% preorden(+A,-R)
% Es cierto cuando R unifica con el recorrido
% en preorden del arbol A
% Raiz, HI, HD

preorden(nil, []).
preorden(a(E,HI,HD), R):-
	preorden(HI,RI),
	preorden(HD, RD),
	append([[E|RI] , RD], R).

% postorden(+A,-R)
% Es cierto cuando R unifica con el recorrido
% en postorden del arbol A
% HI, HD, Raiz

postorden(nil, []).
postorden(a(E,HI,HD), R):-
	postorden(HI,RI),
	postorden(HD, RD),
	append([RI, RD, [E]], R).


arbol1(
	a('+', a('1', nil, nil), a('*', a('2', nil, nil), a('3', nil, nil)))
	).

%QUICKMATHS!
%?- arbol1(A), inorden(A,R).
%A = a(+, a('1', nil, nil), a(*, a('2', nil, nil), a('3', nil, nil))),
%R = ['1', +, '2', *, '3'].

%?- arbol1(A), preorden(A,R).
%A = a(+, a('1', nil, nil), a(*, a('2', nil, nil), a('3', nil, nil))),
%R = [+, '1', *, '2', '3'].

%?- arbol1(A), postorden(A,R).
%A = a(+, a('1', nil, nil), a(*, a('2', nil, nil), a('3', nil, nil))),
%R = ['1', '2', '3', *, +].

% inorden(+A,-R)
% Es cierto cuando 
% en inorden del arbol A
% HI, Raiz, HD

inorden(nil, []).
inorden(a(E,HI,HD), R):-
	inorden(HI,RI),
	inorden(HD, RD),
	append(RI, [E|RD], R).