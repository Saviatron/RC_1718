% crea_arbolg(+L, -Ag)
% Es cierto cuando Ag unifica con un arbol genérico
% que contiene todas las etiquetas de la lista L

crea_arbolg([Cab|Resto], a(Cab, R)):-
	crea_lista_ag(Resto,R).

crea_lista_ag([],[]).

crea_lista_ag([Cab|Resto], [a(Cab,[])|R]):-
	crea_lista_ag(Resto, R).