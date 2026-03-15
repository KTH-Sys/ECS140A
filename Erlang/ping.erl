% Ping process example

-module(ping).
-export([loop/0]).

loop() ->
    receive
        {start, Process} ->
            io:format("starting~n"),
            io:format("sending ping~n"),
            Process ! {ping, self(), 1},
            loop();
        {pong, Process, N} ->
            io:format("sending ping ~p~n", [N + 1]),
            Process ! {ping, self(), N + 1},
            loop();
        _ ->
            io:format("huh?~n"),
            loop()
    end.
