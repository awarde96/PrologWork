numeral(0).
numeral(s(X)):-numeral(X).
numeral(p(X)) :- numeral(X).
numeral(-X) :- numeral(X).
numeral(X-Y) :- numeral numeral(X), numeral(Y).
numeral(X+Y):-numeral(X),numeral(Y).

add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
add(p(X),Y,p(Z)) :- add(X,Y,Z).

comp(s(p(X)),Y):-comp(X,Y),!.
comp(p(s(X)),Y):-comp(X,Y),!.
comp(s(X),s(Y)):-comp(X,Y),!.
comp(p(X),p(Y)):-comp(X,Y),!.
comp(X+Y,Z):-comp(X,A),comp(Y,B),add(A,B,R), comp(R,Z),!.
comp(X-Y,Z):-comp(X,A),comp(Y,B),minus(B,C),add(A,C,D),comp(D,Z),!.
comp(-X,Y):-comp(X,A),minus(A,Z),comp(Z,Y),!.
comp(X,X):-numeral(X).

add2(X,Y,Z):-comp(X,A),comp(Y,B),add(A,B,C),comp(C,Z).

neg(0,0) :- !.
neg(s(X),p(Y)):-comp(X,A),neg(A,Y),!.
neg(p(X),s(Y)):-comp(X,A),neg(A,Y),!.
minus(X,Y):-comp(X,A),neg(A,B),comp(B,Y),!.

subtract(X,Y,Z):-comp(X,A),comp(Y,B),minus(B,C),add(A,C,D),comp(D,Z).




