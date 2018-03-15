% peano2dec (P, D) +->instanciado | ?->Libre
% Es cierto cuando Dec unifica 
% con el decimal equivalente 
% al numero en aritmética de Peano
% ejemplo:
% peano2dec (s(s(s(0))), x).
% x=3.

% P(no)
% P(n-1)->P(n)

p2d(0,0).
p2d(s(P),D2) :- p2d(P, D),  D2 is D+1.
% La suma tiene que ser despues de peano2dec(P, D). Antes D no tiene valor.

% dec2peano (+Dec, ?Peano) +->instanciado | ?->Libre
% Es cierto cuando Peano unifica 
% con el número natural
% equivalente al decimal Dec
% ejemplo:
% dec2peano(3, P).
% P= s(s(s(0))).

% P(no)
% P(n-1)->P(n)

d2p(0,0).
d2p(N,s(P)) :- N>0, N2 is N-1, d2p(N2,P).

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

%ejemplo de ejecucion:
% d2p(12,Z), producto(X,Y,Z), p2d(X,X2), p2d(Y,Y2).

% menor(?X,?Y)
% Es cierto cuando X es meor que Y en
% aritmética de Peano.
menor(0, s(_)).
menor(s(X),s(Y)):-menor(X,Y).

% mayor(?X,?Y)
% Es cierto si X es mayor que Y
mayor(s(_),0).
mayor(s(X),s(Y)):-mayor(X,Y).

% mayor_o_igual (?X,?Y)
% Es cierto si 
mayor_o_igual(X,X).
mayor_o_igual(X,Y):-mayor(X,Y).

% menor_o_igual (?X,?Y)
% Es cierto si 
menor_o_igual(X,X).
menor_o_igual(X,Y):-menor(X,Y).

% divide (?X, ?Y, ?Z, ?R)
% Es cierto si Z unifica con la división entera
% de X entre Y y R unifica con el resto en 
% aritmetica de Peano.
% X será mayor que Y

% 1) P(no)
% 2) P(n-1) -> P(n)

divide(X,Y,0,X):- menor(X,Y).
divide(X,Y,s(Z),R) :- mayor_o_igual(X,Y), resta(X,Y,X2), divide(X2,Y,Z,R).

% EJEMPLO:
%?- d2p(7,X), d2p(2,Y), divide(X,Y,Z,R).
%X = s(s(s(s(s(s(s(0))))))),
%Y = s(s(0)),
%Z = s(s(s(0))),
%R = s(0) ;
