%-----------------------------------------------------
% ordena_burbuja(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.
%-----------------------------------------------------


%-----------------------------------------------------
% ordenada(+Lista)
% es cierto cuando Lista unifica con una lista
% que contiene sus elementos ordenados de menor a
% mayor.
%-----------------------------------------------------

ordena([]).
ordena([_]).
ordena([Cabeza, Cabeza2|Resto]) :- Cabeza =< Cabeza2, ordena([Cabeza2 | Resto]).