%-----------------------------------------------------
% ordena_burbuja(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.
%-----------------------------------------------------

ordena_burbuja(Lista,Lista) :- ordenada(Lista).
ordena_burbuja(Lista, R2) :- 
	append(L1, [E1, E2|Resto], Lista), 
	E1 > E2,
	append(L1, [E2, E1|Resto], R), 
	ordena_burbuja(R,R2).

%-----------------------------------------------------
% ordenada(+Lista)
% es cierto cuando Lista unifica con una lista
% que contiene sus elementos ordenados de menor a
% mayor.
%-----------------------------------------------------

ordenda([]).
ordenada([_]).
ordenada([Cabeza, Cabeza2|Resto]) :- Cabeza =< Cabeza2, ordenada([Cabeza2 | Resto]).


%-----------------------------------------------------
% inserta_en_list_ord(+E, +Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista
% que contiene los elementos de la lista ordenada
% Lista, con el elemento Elem insertado de forma
% ordenada.
%-----------------------------------------------------
inserta_en_list_ord(E, [], [E]).
inserta_en_list_ord(E, [Cab|Resto], [E,Cab|Resto]) :- E =< Cab.
inserta_en_list_ord(E, [Cab|Resto], [Cab|R]) :- 
	E > Cab, 
	inserta_en_list_ord(E, Resto, R).

%-----------------------------------------------------
% ordena_insercion(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.
%-----------------------------------------------------

ordena_insercion([],[]).
ordena_insercion([Cabeza|Resto], R2) :- 
	ordena_insercion(Resto, R1),
	inserta_en_list_ord(Cabeza, R1, R2).

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
divide(E, [Cabeza|Resto], [Cabeza|Menores], Mayores) :- 
	E > Cabeza, divide(E, Resto, Menores, Mayores).
divide(E, [Cabeza|Resto], Menores, [Cabeza|Mayores]) :- 
	E =< Cabeza, divide(E, Resto, Menores, Mayores).

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
ordena_quick([Cabeza|Resto], R):-
	divide(Cabeza, Resto, Menores, Mayores),
	ordena_quick(Menores, MenoresOrd),
	ordena_quick(Mayores, MayoresOrd),
	append(MenoresOrd, [Cabeza|MayoresOrd], R).

% Quick-Maths!!!
lista1([1,3,2,6,5,8,9,4]). %Mas rapido insercion
lista2([9,3,2,6,5,8,9,4]).
lista3([30,3,2,6,7,8,9,4,21,2,35,5,23,23,4,5,4,5,52,1,31,4,24,346,567,4,654,5]). %Mas rapido Quick
% lista2(L), time(ordena_burbuja(L,Ordenada)). -> 226 inferences
% lista2(L), time(ordena_insercion(L,Ordenada)). -> 41 inferences
% lista2(L), time(ordena_quick(L,Ordenada)). -> 78 inferences
