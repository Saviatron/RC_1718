% permutacion(?L1, ?L2).
% Es cierto cuando L1 unifica con una lista
% que contiene los elementos de L2 en orden
% distinto. Por unificación debo poder obtener
% todas las posibles ordenaciones.

permutacion([],[]).
permutacion(R2,[Cabeza|Resto]):- permutacion(R, Resto), insertar(Cabeza, R, R2).

% QuickMaths! - Ejemplo:permutacion(R, [1,2,3]).
%		Ejemplo:permutacion([1,2,3], R). NO FUNCIONAAAA 

% permutacion2([],[]).
% permutation2(R, L):- append(L1,[E|L2], L), append(L1, L2, L3), permutation2(L4,L3), insertar(E,L4,R).


% insertar(E, Lista, R).
% Es cierto cuando R unifica con una lista
% que contiene los elementos de Lista con
% E insertado en cualquier posición. Por
% unificación debe dar todas las posiciones.

insertar(E, Lista, [E|Lista]).
insertar(E, [Cabeza|Resto], [Cabeza|R]):- insertar(E, Resto, R).

