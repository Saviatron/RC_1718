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
	E =< Cabeza, divide(E, Resto, Menores, Mayores).
divide(E, [Cabeza|Resto], Menores, [Cabeza|Mayores]) :- 
	E > Cabeza, divide(E, Resto, Menores, Mayores).

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
	append(MayoresOrd, [Cabeza|MenoresOrd], R).