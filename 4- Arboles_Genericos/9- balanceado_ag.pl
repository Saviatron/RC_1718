:- ensure_loaded('3- altura_ag.pl').

% balanceado_ag(A)

balanceado_ag(a(_, Lista_hijos)):-
	balanceado_ag(Lista_hijos).

balanceado_ag([]).

balanceado_ag([Ca|Resto]):-
	altura_ag(Ca,RCa), Resto \= [],
	altura_ag(Resto, RResto),
	R is RCa - RResto, R2 is abs(R),
	R2 =< 1,
	balanceado_ag(Ca),
	balanceado_ag(Resto).

balanceado_ag([Ca]):-
	balanceado_ag(Ca).