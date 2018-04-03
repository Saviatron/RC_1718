% concatena(+List1, +List2, -ListR).
% 
% Es cierto cuando ListaR unifica con una
% lista que contiene los elementos de la 
% lista List1 en el mism orden y seguidos
% de los elementos de la lista List2 en el
% mismo orden.

% 1) P(n0)
% 2) P(n-1) -> P(n) % P(n) -> P(n+1).

concatena([], L2, L2).
concatena([Cabeza|Resto], L2, [Cabeza| R]) :- concatena(Resto, L2, R).


% concatena(List1, [cabeza | resto], ) :- concatena(List1, resto, R).
% con esta regla, cabeza habria que meterla en a mitad de R, cambiamos de variable


