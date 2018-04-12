%--------------------------------------------------
%
% masveces(+L, -E, -N).
%
%	es cierto cuando E unifica con el elemento
%	que mas veces se repite en L y N con el 
%	numero de veces que se repite
%
%----------------------------------------------------


masveces(L, E, N):-
	msort(L,R),
	comprime(R,R2),
	ordena_quick(R2,R3),
	reverse(R3, [(E,N)|_]).


%--------------------------------------------------
%
% comprime(+Lista, -R)
%
%	Es cierto cuando R unifica con una lista 
%	que contiene los elementos de Lista
%	en formato comprimido:
%
%	Ejemplo:
%	comprime([a,a,a,b,b,c], R).
%	R=[(a,3),(b,2),(c,1)]
%
%----------------------------------------------------

comprime([],[]).

comprime([E], [(E,1)]).

comprime([Cab, Cab|Resto], [(Cab, N2)|R]) :-
	comprime([Cab|Resto], [(Cab, N)|R]),
	N2 is N + 1.

comprime([Cab1, Cab2|Resto], [(Cab1, 1)|R]) :-
	Cab1 \= Cab2,
	comprime([Cab2|Resto], R).

%QuickMaths!
%comprime([a,a,a,b,b,c], R).
%R = [(a, 3),  (b, 2),  (c, 1)] 


%--------------------------------------------------
%
% descomprime(+R, -Lista)
%
%	Es cierto cuando Lista unifica con una lista 
%	que contiene los elementos de R
%	en formato descomprimido:
%
%	Ejemplo:
%	descomprime([(a,3),(b,2),(c,1)], Lista).
%	Lista=[a,a,a,b,b,c]
%
%----------------------------------------------------

descomprime([],[]).
% descomprime([(E,1)], [E]).

descomprime([(E,N)|Resto], [E|R] ) :- 
	N > 1,
        N2 is N - 1,
	descomprime([(E,N2)|Resto], R).
	

descomprime([(E,1)|Resto],  [E|R]) :-
	descomprime(Resto, R).

%Variantes:
%1. [(a,3), (b,2), c]
%2. [a-3, b-2, c-1]


%-----------------------------------------------------
% divide(+Elem, +Lista, -Menores, -Mayores)
%
%	es cierto cuando Menores unifica con una lista que
%	contiene los elemenentos de Lista que son menores
%	o iguales que Elem y Mayores unifica con una lista
%	que contiene los elementos de Lista que son
%	mayores que Elem.
%
%------------------------------------------------------	

divide(_,[],[],[]).
divide(E, [(Valor,N)|Resto], [(Valor, N)|Menores], Mayores) :- 
	N =< E, divide(E, Resto, Menores, Mayores).
divide(E, [(Valor,N)|Resto], Menores, [(Valor,N)|Mayores]) :- 
	N > E, divide(E, Resto, Menores, Mayores).

%---------------------------------------------------
%
% ordena_quick(+Lista, -ListaR).
%
%	es cierto cuando ListaR unifica con una lista que
%	contiene los mismos elementos que Lista ordenados
%	de menor a mayor.
%
%--------------------------------------------------

ordena_quick([], []).
ordena_quick([(Valor,E)|Resto], R):-
	divide(E, Resto, Menores, Mayores),
	ordena_quick(Menores, MenoresOrd),
	ordena_quick(Mayores, MayoresOrd),
	append(MenoresOrd, [(Valor,E)|MayoresOrd], R).

% masveces([a,a,a,b,b,a,b,b,b,b,c],E,R).
% E = b,
% R = 6 .