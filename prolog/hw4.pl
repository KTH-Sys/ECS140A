/* Kyaw Thi Ha
ECS 140A
HW4
Student ID - 925502337 */

%Problem-1

shuffle([], [], []).
shuffle(L1,[],L1).
shuffle([],L2, L2).
shuffle([H1|T1], [H2|T2], [H1,H2|T3]) :- shuffle(T1, T2, T3).

%Problem-2

double([], []).
double([H|T1], [H,H|T2]) :- double(T1, T2).

%Problem-3

% member/2
member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

% base case
no_duplicates([], []).
% H is found in the T. Skip
no_duplicates([H|T], L2) :- member(H, T), no_duplicates(T, L2).
% H is not found in the T. Keep H and find the rest.
no_duplicates([H|T], [H|L2]) :- not(member(H, T)), no_duplicates(T, L2). 

%Problem-4
% select/3
select(X, [X|T], T).
select(X, [H|T], [H|R]) :- select(X, T, R).

% same_elements/2
same_elements([], []).
same_elements(L1, [H|T]) :-
    select(H, L1, R),
    same_elements(R, T).

%Problem-5
% worthy/1 - A row is worthy if every cell has a valid value
worthy([]).
worthy([H|T]) :-
    validval(H),
    worthy(T),
    not(member(H, T)).

% valid values
validval(1). validval(2). validval(3).
validval(4). validval(5). validval(6).
validval(7). validval(8). validval(9).

% diff/1 - True if all elements in the list are different.
diff([]).
diff([H|T]) :- not(member(H, T)), diff(T).

% sudoku/1 - Destructures the 9x9 grid into 9 rows.
sudoku(L) :-
    L = [R1, R2, R3, R4, R5, R6, R7, R8, R9],

    % Fill rows 1-3
    worthy(R1), 
    worthy(R2), columns_diff([R1, R2]),
    worthy(R3), columns_diff([R1, R2, R3]),
    boxes_diff(R1, R2, R3),

    % Fill rows 4-6
    worthy(R4), columns_diff([R1, R2, R3, R4]),
    worthy(R5), columns_diff([R1, R2, R3, R4, R5]),
    worthy(R6), columns_diff([R1, R2, R3, R4, R5, R6]),
    boxes_diff(R4, R5, R6),

    % Fill rows 7-9
    worthy(R7), columns_diff([R1, R2, R3, R4, R5, R6, R7]),
    worthy(R8), columns_diff([R1, R2, R3, R4, R5, R6, R7, R8]),
    worthy(R9), columns_diff([R1, R2, R3, R4, R5, R6, R7, R8, R9]),
    boxes_diff(R7, R8, R9).

% columns_diff/1 - 
% Transposes the partial rows into columns, then checks every column has all differentn values.
columns_diff(Rows) :- transpose(Rows, Cols), check_all_cols(Cols).

% check_all_cols/1 - Iterates through each column and
% verifies all elements are different
check_all_cols([]).
check_all_cols([H|T]) :- diff(H), check_all_cols(T).

% transpose/2 - Converts rows into columns (matrix transpose).
transpose([], []).
transpose([[]|_], []).
transpose(Rows, [Col|Cols]) :-
    split_first(Rows, Col, Rest),
    transpose(Rest, Cols).

% split_first/3 - Extracts the first element of each row into a column list
split_first([], [], []).
split_first([[H|T]|Rows], [H|Hs], [T|Ts]) :-
    split_first(Rows, Hs, Ts).

% boxes_diff/3 - Checks the three 3x3 boxes
boxes_diff(R1, R2, R3) :-
    % Split each row into three groups of 3 (left, middle, right)
    R1 = [L1,L2,L3, M1,M2,M3, R1a,R1b,R1c],
    R2 = [L4,L5,L6, M4,M5,M6, R2a,R2b,R2c],
    R3 = [L7,L8,L9, M7,M8,M9, R3a,R3b,R3c],
    % Left
    diff([L1,L2,L3,L4,L5,L6,L7,L8,L9]),
    % Middle 
    diff([M1,M2,M3,M4,M5,M6,M7,M8,M9]),
    % Right 
    diff([R1a,R1b,R1c,R2a,R2b,R2c,R3a,R3b,R3c]).

% TEST!!!
test :-
	test0, nl,
	test0a, nl,
	test0b, nl,
	test0c.

/* This is a completly solved solution. */
test0 :-
	L = [
             [9,6,3,1,7,4,2,5,8],
             [1,7,8,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,9,6],
             [4,9,6,8,5,2,3,1,7],
             [7,3,5,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This has a solution (the one in test0) which 
should be found very quickly. */
test0a :-
	L = [
             [9,_,3,1,7,4,2,5,8],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,_,6],
	     [4,9,6,8,5,2,3,1,7],
             [7,3,_,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This has a solution (the one in test0) and 
may take a few seconds to find. */
test0b :-
	L = [
             [9,_,3,1,7,4,2,5,_],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,_,9,_,3,1],
             [_,2,1,4,3,_,5,_,6],
             [4,9,_,8,_,2,3,1,_],
             [_,3,_,9,6,_,8,2,_],
             [5,8,9,7,1,3,4,6,2],
             [_,1,7,2,_,6,_,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This one obviously has no solution (column 2 has 
two nines in it.) and it may take a few seconds 
to deduce this. */
test0c :-
	L = [
             [_,9,3,1,7,4,2,5,8],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,_,6],
	     [4,9,6,8,5,2,3,1,7],
             [7,3,_,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* test1 from lecture slides. */
test1 :-
	L = [
             [_,6,_,1,_,4,_,5,_],
             [_,_,8,3,_,5,6,_,_],
             [2,_,_,_,_,_,_,_,1],
             [8,_,_,4,_,7,_,_,6],
             [_,_,6,_,_,_,3,_,_],
             [7,_,_,9,_,1,_,_,4],
             [5,_,_,_,_,_,_,_,2],
             [_,_,7,2,_,6,9,_,_],
             [_,4,_,5,_,8,_,7,_]],
        sudoku(L),
        printsudoku(L).

% print sudoku table
printsudoku([]).
printsudoku([H|T]) :-
	write(H),nl,
	printsudoku(T).