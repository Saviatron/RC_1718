% reverse(+Lista, -ListaR).
% Es cierto cuando ListaR unifica con una lista 
% que contiene los mismos elementos que Lista pero en orden inverso.

reverse([], []).
reverse([Cabeza|Resto], R2) :- reverse(Resto,X), insertar_final(Cabeza,X,R2).


% insertar_final(+E, +Lista, -R)
% Es crieto cuando R unifica con una lista
% que contiene los elementos de Lista con 
% el elemento E insertado al final.

insertar_final(E, [], [E]).
insertar_final(E, [Cabeza|Resto], [Cabeza|Salida]) :- insertar_final(E, Resto, Salida).