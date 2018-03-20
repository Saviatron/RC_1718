% resta(?X, ?Y, ?Z)
% es cierto cuando Z unifica con la resta
% de X menos Y en aritmética de Peano.
% X tiene que ser mayor que Y.

% Principio de Inducción.
% P(no)
% P(n-1) -> P(n)

resta(X, 0, X).
resta(X, s(Y), Z) :- resta(X, Y, s(Z)).
% QuickMaths! 4-2=2 -> 4-1=3