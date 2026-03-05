member(X,[X|_]).
member(X,[_|T]) :- member(X,T).

% 1 ?- member(b,[a,b,c]).
% true .

% 2 ?-  member(X,[a,b,c]).
% X = a .

% 3 ?-  member(b,X).
% X = [b|_] .
