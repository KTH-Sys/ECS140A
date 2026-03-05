% valid values
validval(1). validval(2). validval(3).
validval(4). validval(5). validval(6).
validval(7). validval(8). validval(9).

% member/2
member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

% sudoku/1 - Solves a 9x9 Sudoku grid using MCV (Most Constrained Variable) heuristic.
sudoku(L) :-
    L = [_, _, _, _, _, _, _, _, _],
    solve(L).

% solve/1 - Find the most constrained blank cell, try values from its domain, recurse.
solve(Grid) :-
    find_blanks(Grid, Grid, 0, Blanks),
    assign(Blanks, Grid).

% assign/2 - No blanks left means the puzzle is solved.
assign([], _).
assign(Blanks, Grid) :-
    sort(Blanks, [Size-Var-Domain|_]),
    Size > 0,
    member(Val, Domain),
    Var = Val,
    solve(Grid).

% find_blanks/4 - Collect all blank cells with their domain size, variable ref, and domain.
find_blanks([], _, _, []).
find_blanks([Row|Rows], Grid, RI, Blanks) :-
    find_blanks_row(Row, Grid, RI, 0, RowBlanks),
    RI1 is RI + 1,
    find_blanks(Rows, Grid, RI1, RestBlanks),
    append(RowBlanks, RestBlanks, Blanks).

find_blanks_row([], _, _, _, []).
find_blanks_row([Cell|Cells], Grid, RI, CI, Blanks) :-
    nonvar(Cell),
    CI1 is CI + 1,
    find_blanks_row(Cells, Grid, RI, CI1, Blanks).
find_blanks_row([Cell|Cells], Grid, RI, CI, [Size-Cell-Domain|RestBlanks]) :-
    var(Cell),
    possible_values(Grid, RI, CI, Domain),
    length(Domain, Size),
    CI1 is CI + 1,
    find_blanks_row(Cells, Grid, RI, CI1, RestBlanks).

% possible_values/4 - Compute valid values for cell at (RI, CI).
% A value is valid if it doesn't appear (bound) in the same row, column, or 3x3 box.
possible_values(Grid, RI, CI, Domain) :-
    nth0(RI, Grid, Row),
    get_col(Grid, CI, Col),
    BoxR is (RI // 3) * 3,
    BoxC is (CI // 3) * 3,
    get_box(Grid, BoxR, BoxC, Box),
    findall(V, (validval(V),
                not(bound_in(V, Row)),
                not(bound_in(V, Col)),
                not(bound_in(V, Box))), Domain).

% bound_in/2 - True if V equals some nonvar element in the list.
bound_in(V, [H|_]) :- nonvar(H), H == V.
bound_in(V, [_|T]) :- bound_in(V, T).

% get_col/3 - Extract column CI from the grid.
get_col([], _, []).
get_col([Row|Rows], CI, [Cell|Rest]) :-
    nth0(CI, Row, Cell),
    get_col(Rows, CI, Rest).

% get_box/4 - Extract the 9 cells of the 3x3 box starting at (BR, BC).
get_box(Grid, BR, BC, Box) :-
    R0 is BR, R1 is BR+1, R2 is BR+2,
    C0 is BC, C1 is BC+1, C2 is BC+2,
    nth0(R0, Grid, Row0), nth0(C0, Row0, A), nth0(C1, Row0, B), nth0(C2, Row0, C),
    nth0(R1, Grid, Row1), nth0(C0, Row1, D), nth0(C1, Row1, E), nth0(C2, Row1, F),
    nth0(R2, Grid, Row2), nth0(C0, Row2, G), nth0(C1, Row2, H), nth0(C2, Row2, I),
    Box = [A,B,C,D,E,F,G,H,I].

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
