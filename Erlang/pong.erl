% Pong process example

-module(pong).
-export([loop/0]).

loop() ->
    receive
        {ping, Process, N} ->
            io:format("sending pong ~p~n", [N + 1]),
            Process ! {pong, self(), N + 1},
            loop();
        _ ->
            io:format("huh?~n"),
            loop()
    end.
