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

producto(X,0,0).
producto(X,s(Y),Z2) :- producto(X,Y,Z), suma(Z,X,Z2). 
