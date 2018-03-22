% borrar_elem(?E, ?Lista, ?ListaR).
% Es cierto cuando LisatR unifica con una lista
% que contiene los elementos de Lista
% pero con lass ocurrencias de E eliminadas.

borrar_elem(_, [], []).
borrar_elem(E, [E|Resto], R):- borrar_elem(E, Resto, R).
borrar_elem(E, [Cabeza|Resto],  [Cabeza|R]):- E \= Cabeza, borrar_elem(E, Resto, R).


% QuickMaths! - Ejemplo de ejecucion: borrar_elem(2 , [2,3,1] , Lista).