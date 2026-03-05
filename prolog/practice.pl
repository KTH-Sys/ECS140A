% 1.	triple(L1, L2)
% Write a predicate where every element in L1 appears three times consecutively in L2.
% ?- triple([a,b,c], X).
% X = [a,a,a,b,b,b,c,c,c]

triple([],[]).
triple([H|T], [H, H, H| T2]) :- triple(T, T2).

% 2. every_second(L1, L2)
% L2 contains every second element of L1.
% ?- every_second([a,b,c,d,e,f],[b,d,f]).

every_second([],[]).
every_second([_],[]).
every_second([_, H|T], [H|R]) :- every_second(T, R).

% 3. duplicate_first(L1, L2)
% L2 is L1 with the first element duplicated.
% ?- duplicate_first([a,b,c],[a,a,b,c]).

duplicate_first([],[]).
duplicate_first([H|T], [H,H|T]).

%  4. remove_all(X, L1, L2)
% Remove all occurrences of X from L1.
% remove_all(b,[a,b,c,b,d],[a,c,d]).

remove(X, [X|T], T).
remove(X, [H|T], [H|R]) :-
    remove(X, T, R).

remove_all(_, [], []).
remove_all(X, [X|T], R) :-
    remove_all(X, T, R).
remove_all(X, [H|T], [H|R]) :-
    X \= H,
    remove_all(X, T, R).

% 5. keep_last_two(L1, L2)
% Keep only the last two elements of L1.
% keep_last_two([a,b,c,d,e],[d,e]).
keep_last_two([A,B], [A,B]).
keep_last_two([_|T], L2) :- keep_last_two(T,L2).

%6. subset_list(L1, L2)
% True if every element in L1 appears somewhere in L2.
% subset_list([a,c],[a,b,c,d]).
member(X, [X|_]).
member(X, [_|T]) :- member(X,T).

subset_list([], _).
subset_list([H|T], L2) :- member(H,L2), subset_list(T, L2).





