% camino(+g(V,A), +Ini, +Fin, +Visitados, -Camino)

% Es cierto cuando Camino unifica con una lista
% de aristas que va desde Ini hasta Fin sin repetir
% v�rtices.

camino(G, Ini, Fin, Visitados, [a(Ini,Fin)]) :-
	conectado(G, Ini, Fin),
	\+ member(a(Ini, Fin), Visitados).

camino(g(_,A), Ini, Fin, Visitados, [a(Ini,TMP)|Camino]) :-
	conectado(g(_,A), Ini, TMP),
	\+ member(a(Ini,TMP), Visitados),
	camino(g(_,A), TMP, Fin, [a(Ini, TMP), a(TMP, Ini)|Visitados], Camino).

% conectado(+g(V,A), +Ini, +Fin)

% Es cierto si existe una conexi�n directa
% desde Ini hasta Fin y desde Fin hasta Ini

conectado(g(_,A), Ini, Fin) :-
	member(a(Ini, Fin), A).
conectado(g(_,A), Ini, Fin) :-
	member(a(Fin, Ini), A).



%Grafo dirigido
grafo1(g([a,b,c,d,e], [a(a,b), a(b,c), a(c,d), a(d,b)])).

% sobre
%     a
%    / \
%   /   \
%  b --- c
%  | \ / |
%  | / \ |
%  d --- e
%Grafo Sobre
grafo2(g([a,b,c,d], [a(a,b), a(a,c), a(b,c), a(b,d), a(b,e), a(c,d), a(c,e), a(d,e)])).


%QUICKMATHS!

%?- grafo2(G), camino(G, _, _, [], C), length(C,8).
%G = g([a, b, c, d], [a(a, b), a(a, c), a(b, c), a(b, d), a(b, e), a(c, d), a(c, e), a(..., ...)]),
%C = [a(d, e), a(e, b), a(b, c), a(c, d), a(d, b), a(b, a), a(a, c), a(c, e)] 

