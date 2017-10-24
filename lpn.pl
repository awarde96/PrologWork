numeral(0).
numeral(s(X)):-numeral(X).
numeral(p(X)) :- numeral(X).
numeral(X+Y):-numeral(X),numeral(Y).

add(0,X,X).
add(0,p(s(X)),X).
add(p(s(X)),Y,Z):-add(X,Y,Z).
add(X,p(s(Y)),Z):-add(X,Y,Z).
add(s(p(X)),Y,Z):-add(X,Y,Z).
add(X,s(p(Y)),Z):-add(X,Y,Z).
add(s(X),Y,s(Z)):-add(X,Y,Z).
add(p(X),Y,p(Z)):-add(X,Y,Z).


add2(X+Y,Z,R) :- add(X,Y,A),add2(A,Z,R).
add2(X,Y+Z,R) :- add(Y,Z,A),add2(X,A,R).
add2(X+Y,Z+W,R) :- add(X,Y,A),add(Z,W,B),add2(A,B,R).
add2(X,Y,R) :- add(X,Y,R).
