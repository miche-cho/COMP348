%get a reversed lucas series since it is much easier to manipulate the head
ilucas(1,[2]).
ilucas(2,[1,2]).
ilucas(N,[H|[H2|[H3|T]]]):-
    N>2,N1 is N-1,N2 is N-2,
    ilucas(N1,[H2|[H3|T]]),ilucas(N2,[H3|T]),
    H is (H2+ H3).
%reverse it to get the lucas series
reverse([],X,X).
reverse([H|T],X,A):- reverse(T,X,[H|A]).

lucas(X,L):- ilucas(X,Li), reverse(Li,L,[]).