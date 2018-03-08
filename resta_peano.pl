% suma(?X, ?Y, ?Z)
% es cierto cuando Z unifica con la suma
% de X e Y en aritmética de Peano.

resta(X, 0, X).
resta(X, s(Y), Z) :- resta(X, Y, s(Z)).
% QuickMaths! 4-2=2 -> 4-1=3