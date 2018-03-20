% dec2peano (+Dec, ?Peano) +->instanciado | ?->Libre
% Es cierto cuando Peano unifica 
% con el número natural
% equivalente al decimal Dec
% ejemplo:
% dec2peano(3, P).
% P= s(s(s(0))).

% P(no)
% P(n-1)->P(n)

dec2peano(0,0).
dec2peano(N,s(P)) :- N>0, N2 is N-1, dec2peano(N2,P).