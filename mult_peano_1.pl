% suma(?X, ?Y, ?Z)
% es cierto cuando Z unifica con la suma
% de X e Y en aritmética de Peano.

suma(0, Y, Y).
suma(s(X), Y, s(Z)) :- suma(X, Y, Z).

% resta(?X, ?Y, ?Z)
% es cierto cuando Z unifica con la resta
% de X e Y en aritmética de Peano.

% QuickMaths! X-Y=Z -> X=Z+Y
resta(X, Y, Z) :- suma(Y,Z,X). %suma(Z,Y,X).

% producto(?X, ?Y, ?Z)
% Es cierto cuando Z unifica con
% el producto de X por Y

producto(_,0,0).
producto(X,s(Y),Z2) :- producto(X,Y,Z), suma(X,Z,Z2). 

% P(n) <- P(n-1)
% 4 * 3 = 4+4+4 <- 4 * 2= 4+4
% X  s(Y)   Z2     X   Y   Z    -> Z2 = Z+X

