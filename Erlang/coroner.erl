-module(coroner).
-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(gun, spawn_link(fun roulette:loop/0)),
            loop();

        {'EXIT', From, Reason} ->
            io:format("The shooter ~p died with reason ~p.~n",
                      [From, Reason]),
            io:format("Restarting.~n"),
            self() ! new,
            loop()
    end.

% {monitor, Process} ->
% link(Process),
% io:format("Monitoring process.~n"),
% loop();
% Coroner = spawn(fun coroner:loop/0).
% process_flag(trap_exit, true)
% Gun = spawn(fun roulette:loop/0).
% Coroner ! {monitor, Gun}. or
% Coroner ! new.
% excute {monitor, Process} and link(Gun)
% Gun dies with reason: {roulette,die,at,{10,45,15}}
% Because of gun link to Coroner: send to coroner
% {'EXIT', Gun, {roulette,die,at,{10,45,15}}} and execute
% start new -> loop () 
