% suma(?X, ?Y, ?Z)
% es cierto cuando Z unifica con la suma
% de X e Y en aritm�tica de Peano.

suma(0, Y, Y).
suma(s(X), Y, s(Z)) :- suma(X, Y, Z).