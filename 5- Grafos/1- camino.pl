% camino(+g(V,A), +Ini, +Fin, +Visitados, -Camino)

% Es cierto cuando Camino unifica con una lista
% de aristas que va desde Ini hasta Fin sin repetir

camino(_, Ini, Ini, _, [Ini]).

camino(g(_,A), Ini, Fin, Visitados, [Ini|Camino]) :-
	member(a(Ini, TMP), A),
	\+ member(TMP, Visitados),
	camino(g(_,A), TMP, Fin, [TMP|Visitados], Camino).

%Grafo dirigido
grafo(g([a,b,c,d], [a(a,b), a(b,c), a(c,d), a(d,b)])).

%QUICKMATHS

%?- grafo(G), camino(G, a, d, [], Camino).
%G = g([a, b, c, d], [a(a, b), a(b, c), a(c, d), a(d, b)]),
%Camino = [a, b, c, d] ;
%false.