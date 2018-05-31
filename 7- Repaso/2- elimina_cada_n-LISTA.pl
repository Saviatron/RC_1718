% elimina_cada_n(+Lista, +N, -R)
% elimina_cada_n([1,2,3,4,5,6,7], 3, R)
% R=[1,2,4,5,7]

elimina_cada_n(L, N, L ):-
	length(L,Long), Long < N.

elimina_cada_n(L, N, R2 ):-
	%length(L,Long), Long >= N,
	N2 is N-1,
	length(L1, N2), % crea una lista L con N2 elementos
	append(L1, [_|Resto], L),
	elimina_cada_n(Resto, N, R),
	append(L1, R, R2).
