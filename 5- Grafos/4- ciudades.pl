


% conectado(+Grafo, +Ini, +Fin, -Carretera, -Kilometros)
conectado(g(_, Aristas), Ini, Fin, C, K):-
	member(a(Ini, Fin,C,K), Aristas).

conectado(g(_, Aristas), Ini, Fin, C, K):-
	member(a(Fin, Ini,C,K), Aristas).

% visitado(+Ini, +Fin, +Visitados)
visitado(Ini, Fin, Visitados):-
	member(a(Ini, Fin,_,_), Visitados).
%Comentar para poder volver
visitado(Ini, Fin, Visitados):-
	member(a(Fin,Ini,_,_), Visitados).

%camino(+Grafo, +Ini, +Fin, +Visitados, -Ciudades, -Carreteras, -Kilometros)
camino(_, Fin, Fin, _, [Fin], [], 0).
%camino(G, Ini, Fin, _, [Ini,Fin], [Carretera], K):-
%	conectado(G, Ini, Fin, Carretera, K).

camino(G, Ini, Fin, Visitados, [Ini|Ciudades],[Carretera|Carreteras], K2):-
	conectado(G, Ini, TMP, Carretera, K),
	\+ visitado(Ini, TMP, Visitados),
	camino(G, TMP, Fin, [a(Ini,TMP,_,_)|Visitados], Ciudades, Carreteras, Kilometros),
	K2 is Kilometros + K.

grafo(g([madrid, cordoba, sevilla, jaen, granada,huelva, cadiz],
	[a(huelva, sevilla, a49, 94),
	a(sevilla, cadiz,ap4, 125),
	a(sevilla, granada, a92, 256),
	a(granada, jaen,a44, 97),
	a(sevilla, cordoba, a4, 138),
	a(jaen,madrid, a4, 335),
	a(cordoba, madrid, a4, 400)])).

%QUICKMATHS
%?- grafo(G), camino(G, huelva, cordoba, [], C,Ca,K).

%G = g([madrid, cordoba, sevilla, jaen, granada, huelva, cadiz], [a(huelva, sevilla, a49, 94), a(sevilla, cadiz, ap4, 125), a(sevilla, granada, a92, 256), a(granada, jaen, a44, 97), a(sevilla, cordoba, a4, 138), a(jaen, madrid, a4, 335), a(cordoba, madrid, a4, 400)]),
%C = [huelva, sevilla, granada, jaen, madrid, cordoba],
%Ca = [a49, a92, a44, a4, a4],
%K = 1182 ;

%G = g([madrid, cordoba, sevilla, jaen, granada, huelva, cadiz], [a(huelva, sevilla, a49, 94), a(sevilla, cadiz, ap4, 125), a(sevilla, granada, a92, 256), a(granada, jaen, a44, 97), a(sevilla, cordoba, a4, 138), a(jaen, madrid, a4, 335), a(cordoba, madrid, a4, 400)]),
%C = [huelva, sevilla, cordoba],
%Ca = [a49, a4],
%K = 232 ;