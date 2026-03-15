-module(roulette).
-export([loop/0]).

loop() ->
    receive
        3 ->
            io:format("bang!~n"),
            exit({roulette,die,at,erlang:time()});

        _ ->
            io:format("click~n"),
            loop()
    end.

% Gun = spawn(fun roulette:loop/0).
% <0.91.0>
% Gun ! 1.
%click
%1
% Gun ! 2.
%click
%2
% Gun ! 3.
%bang!
%3
% Gun ! 4.
%4 (The Process Dies!)