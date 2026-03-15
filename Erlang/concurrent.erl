% Concurrent Programming

-module(concurrent).
-export([loop/0]).

% loop() ->
%    io:format("Running...~n"),
%    loop().
% Running forever...

% Creating a Process
% spawn(Function)
% spawn(fun loop/0).

% Process ID
% P = spawn(fun loop/0).
% <0.79.0>

% Sending Messages
% Pid ! Message
% P ! hello.
% send message "hello" to process P

% Receiving Messages
% loop() ->
%    receive
%       hello ->
%           io:format("Hello received~n")
%   end.
%   loop().

loop() ->
    receive
        hello ->
            io:format("right back atcha~n"),
            loop();
        _ ->
            io:format("sorry, I don't speak erlang~n"),
            loop()
    end.

% P = spawn(fun loop/0).
% P ! hello.
% > Hello received
% receive message
% process message
% call loop again
% wait for next message

% 6> f(P).
% ok
% 7> P = spawn(fun concurrent:loop/0).
% <0.105.0>
% 8> P ! hello.
% right back atcha
% hello
% 9> P ! hi.
% sorry, I don't speak erlang
% hi

% Using Tuples for Messages
% {message_type, data}
% See ping.erl and pong.erl for a ping-pong example.


