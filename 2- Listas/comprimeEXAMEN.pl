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

descomprime([(E,N)|Resto], [E|R] ) :- N > 1,
        N2 is N - 1,
	descomprime([(E,N2)|Resto], R).
	

descomprime([(E,1)|Resto],  [E|R]) :-
	descomprime(Resto, R).

%descomprime([(E1,1)|Resto],  [E1 | R]) :-
%	descomprime(Resto, R).
