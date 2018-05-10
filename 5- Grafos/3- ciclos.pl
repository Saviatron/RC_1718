:- ensure_loaded('2- sobre.pl').

% ciclos(+G, -C).
%
% Es cierto cuando C unifica con cualquier ciclo del
% grafo G, por unificción debo poder encontrar
% todos los ciclos del grafo G.

ciclos(G,C):- camino(G, Ini, Ini, [], C).


% lista_ciclos(+G,-

lista_ciclos(G, L):- bagof(C, camino(G, Ini,Ini,[], C), L).