
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


% anchura(+A,-R)
% Es cierto cuando R unifica con el recorrido
% en anchura del arbol A

% Esto no es recursividad, uno es un arbol y otro una lista,
% por eso no necesito caso base.
anchura(a(E,Lista_hijos), [E|R]) :-
	anchura(Lista_hijos, R).
% Aqui si hay recursividad, si necesitamos caso base.
anchura([], []).
anchura([a(E, L)|Resto], [E|R2]) :-
	append(Resto, L, R),
	anchura(R,R2).

% bin2gen(+A,-R)
% Es cierto cuando R unifica con el arbol
% generico de A

bin2gen(a(E, HI, HD), a(E, [RI,RD])) :-
	HI \=nil, HD \=nil,
	bin2gen(HI, RI),
	bin2gen(HD, RD).

bin2gen(a(E, HI, nil), a(E, [RI])) :-
	bin2gen(HI, RI).

bin2gen(a(E, nil, HD), a(E, [RD])) :-
	bin2gen(HD, RD).

bin2gen(a(E, nil, nil), a(E, [])).


arbol1(
	a('+', a('1', nil, nil), a('*', a('2', nil, nil), a('3', nil, nil)))
	).

arbol2(
	a('+', a('-', a('4', nil, nil), a('5', nil, nil)), a('*', a('2', nil, nil), a('3', nil, nil)))
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
