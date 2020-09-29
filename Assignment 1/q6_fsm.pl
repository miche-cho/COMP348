/* QUESTION 6*/
/* This program simulates a finite state machine */

/*Database for the initial state, final state and the paths*/
start(s1).
final(s1).
transition(s1,a,s2).
transition(s2,a,s2).
transition(s2,b,s1).
transition(s2,c,s4).
transition(s3,a,s1).
transition(s3,b,s4).
transition(s4,d,s3).

accept(L) :- start(S), path(Q, L).
path(Q, [Lh | Lt]) :- transition(Q, X, QI), path(QI, Lt).
path(Q,[]):- final(Q).