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
/*
part 2. verifying if the sequence "a a b" is accepted by the machine.
?- accept([a,a,b]).

OUTPUT:
true

part 3. Explanation

Looking at the image of the machine, we know its initial and final state is S1. 
The path defined by "a" transitions from S1 to S2.
The path defined by "a" transitions from S2 to itself.
The path defined by "b" transitions from S2 to S1.

Since S1 is a final state, the final state machine can terminate there. 
Thus, "a a b" is a valid sequence.
*/
