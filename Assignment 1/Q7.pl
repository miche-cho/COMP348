and(1,0,0).
and(0,1,0).
and(0,0,0).
and(1,1,1).
or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).
inv(0,1).
inv(1,0).
or(E1,E2,E3,Out) :- or(E1,E2,T1),or(T1,E3,Out).			%or for 3,4,5 input T stand for Temp
or(E1,E2,E3,E4,Out):- or(E1,E2,T1),or(E3,E4,T2),or(T1,T2,Out).	
or(E1,E2,E3,E4,E5,Out):- or(E1,E2,E3,E4,T1),or(E5,T1,Out).
and(E1,E2,E3,Out):- and(E1,E2,T1),and(T1,E3,Out).

%define circuit a to g seperately here
circuita(A,B,C,D,Out):- inv(B,B1),inv(D,D1),and(B1,D1,T1),and(B,D,T2),or(A,T1,T2,C,Out).
circuitb(A,B,C,D,Out):- inv(B,B1),inv(C,C1),inv(D,D1),and(C,D,T1),and(C1,D1,T2),or(A,B1,T1,T2,Out).
circuitc(B,C,D,Out):- inv(C,C1),inv(D,D1),and(C1,D1,T1),or(B,D,T2),or(T2,T1,Out).
circuitd(A,B,C,D,Out):- inv(B,B1),inv(C,C1),inv(D,D1),
	and(B1,D1,T1),and(C,D1,T2),and(B1,C,T3),
	and(B,C1,D,T4),or(A,T1,T2,T3,T4,Out).
circuite(B,C,D,Out):- inv(B,B1),inv(D,D1),and(B1,D1,T1),and(C,D1,T2),or(T1,T2,Out).
circuitf(A,B,C,D,Out):- inv(C,C1),inv(D,D1),
	and(B,D1,T1),and(C1,D1,T2),and(B,C1,T3),
	or(A,T1,T2,T3,Out).
circuitg(A,B,C,D,Out):- inv(B,B1),inv(C,C1),inv(D,D1),and(C,D1,T1),and(B1,C,T2),and(B,C1,T3),or(A,T1,T2,T3,Out).

circuit(Ai,Bi,Ci,Di,A,B,C,D,E,F,G) :- 
	circuita(Ai,Bi,Ci,Di,A),
	circuitb(Ai,Bi,Ci,Di,B),
	circuitc(Bi,Ci,Di,C),
	circuitd(Ai,Bi,Ci,Di,D),
	circuite(Bi,Ci,Di,E),
	circuitf(Ai,Bi,Ci,Di,F),
	circuitg(Ai,Bi,Ci,Di,G).

