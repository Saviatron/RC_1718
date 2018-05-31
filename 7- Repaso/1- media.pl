% media(+Lista, -Media)
% Es cierto cuando Media unifica con la media
% aritmetica de todos los elementos de Lista.

% media(Lista, R):-
%	sum_list(Lista, S),
%	length(Lista, L), R is S/L.

media([], 0, 0).

media([Ca|Resto], Cont, Med):-
	C is Cont - 1,
	media(Resto,C, M),
	Med is (C * M + Ca) / Cont .