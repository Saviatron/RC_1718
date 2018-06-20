
% mas_veces(+Lista, -Elem, -Num).
% Es cierto cuando E unifica con el elemento 
% que mas veces aparece en Lista y N el numero 
% de veces que aparece.

mas_veces(Lista, E, N):-
	msort(Lista, ListaOrd),
	comprime(ListaOrd, ListaComp),
	ord_tuplas(ListaComp, ListaCompOrd),
	reverse(ListaCompOrd, [(E,N)|_]).

% insertar_ord

insertar_ord((E,N), [], [(E,N)]).

insertar_ord((E,N), [(Cab, NCab) | Resto], [(E,N), (Cab,NCab) | Resto]):-
	N =< NCab.
	
insertar_ord((E,N), [(Cab, NCab) | Resto], [(Cab,NCab) | R]):-
	N > NCab,
	insertar_ord((E,N), Resto, R).

% ord_tuplas

ord_tuplas([], []).

ord_tuplas([Cab|Resto], R2):-
	ord_tuplas(Resto, R),
	insertar_ord(Cab, R, R2).

% comprime

comprime([],[]).

comprime([E], [(E,1)]).

comprime([Cab, Cab|Resto], [(Cab, N2)|R] ):-
	comprime([Cab|Resto], [(Cab, N)|R]),
	N2 is N+1.

comprime([Cab1, Cab2|Resto], [(Cab1, 1)|R] ):-
	Cab1 \=Cab2,
	comprime([Cab2|Resto], R).


comparar(<, (_,N1), (_, N2)):- N1<N2.
% comparar(<, (E1,N1), (E2, N2)):- E1==E2, E1 @< E2.
comparar(=, (_,N1), (_,N2)):- N1 == N2.
comparar(>, (_,N1), (_,N2)):- N1 > N2.
% comparar(<, (E1,N1), (E2, N2)):- E1==E2, E1 @< E2.
	
predsort(comparar, [(a,2), (b,3)], R).