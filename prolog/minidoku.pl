sudoku(L) :- [X1,X2,X3] = L,
worthy([X1,X2,X3]).

worthy(L) :- valid(L),diff(L).

valid([H]) :- validval(H).
valid([H|T]) :- validval(H),valid(T).

validval(1).
validval(2).
validval(3).

diff([_]).
diff([H|T]) :- not(member(H,T)),diff(T).

member(H,[H|_]).
member(X,[_|T]) :- member(X,T).
