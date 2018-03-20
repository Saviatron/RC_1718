% peano2dec (P, D) +->instanciado | ?->Libre
% Es cierto cuando Dec unifica 
% con el decimal equivalente 
% al numero en aritmética de Peano
% ejemplo:
% peano2dec (s(s(s(0))), x).
% x=3.

% P(no)
% P(n-1)->P(n)

peano2dec(0,0).
peano2dec(s(P),D2) :- peano2dec(P, D),  D2 is D+1.
% La suma tiene que ser despues de peano2dec(P, D). Antes D no tiene valor.