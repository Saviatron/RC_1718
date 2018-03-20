% elemento_enesimo(+Pos, +Lista, -Elem).
% Es cierto cuando Elem unifica con el elemento que ocupa 
% la posición Pos dentro de Lista.

elemento_enesimo(0, [Cabeza|_], Cabeza).
elemento_enesimo(Pos, [_|Resto], Salida) :- Pos2 is Pos - 1, elemento_enesimo(Pos2, Resto, Salida).
