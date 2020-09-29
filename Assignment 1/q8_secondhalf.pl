/*Question 8*/

/*  This functor discards recursively the head of the list 
    until it reaches half the size of the original list.
*/
separate([_|T], Size, SecondHalf):- length(T, Size1), (Size1 =< Size/2 -> SecondHalf = T; separate(T, Size, SecondHalf)).

/*  This functor generates the second half of a list*/
second_half(L, X):- length(L, Size), separate(L, Size, X).
/* 
?- second_half([a,b,c,d,e,f,g,h], X)

OUTPUT
X = [e,f,g,h].

?- second_half([d,e,f,g,h], X)

OUTPUT
X = [g,h].
*/
