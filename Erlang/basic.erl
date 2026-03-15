-module(basic).
-export([start/0, get_name/0, get_profession/0, double/1, fact/1, my_length/1, mysum/1, myelem/2, repeat/1, mymap/2, square/1, lt3/1, mymap2/2]).

start() ->
    Person = {person, {name, "Kurt"}, {profession, "crushing souls"}},

    %% Pattern matching to extract values (like Prolog)
    {person, {name, N}, {profession, P}} = Person,
    {N, P}.

get_name() ->
    Person = {person, {name, "Kurt"}, {profession, "crushing souls"}},
    {person, {name, N}, {profession, _}} = Person,
    N.

get_profession() ->
    Person = {person, {name, "Kurt"}, {profession, "crushing souls"}},
    {person, {name, _}, {profession, P}} = Person,
    P.

% double
double(Number) -> 2 * Number.

% factorial
fact(0) -> 1;
fact(N) -> N * fact(N - 1).

% length
my_length([]) -> 0;
my_length([_|T]) -> 1 + my_length(T).

% sum in list
mysum([]) -> 0;
mysum([H|T]) -> H + mysum(T).

% element in list
myelem(Item, []) -> false;
myelem(Item, [Item|Ys]) -> true;
myelem(Item, [_|Ys]) -> myelem(Item, Ys).

% repeat
repeat([]) -> [];
repeat([H|T]) -> [H | [H | repeat(T)]].

% square
square(N) -> N * N.

% mymap
mymap(F,[]) -> [];
mymap(F, [H|T]) -> [F(H) | mymap(F,T)].

% less than 3
lt3(X) -> X < 3.


% List Comprehension
% Numbers = [1,2,3,4].
% [square(X) || X <- Numbers].
% [1,4,9,16]

% [X * X || X <- [1,2,3,4]].
% [1,4,9,16]

% mymap2
mymap2(F,L) -> [F(X) || X <- L].