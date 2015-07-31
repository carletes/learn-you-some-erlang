-module(dog_fsm).
-export([start/0, pet/1, squirrel/1]).

start() ->
    spawn(fun() -> bark() end).

pet(Pid) ->
    Pid ! pet.

squirrel(Pid) ->
    Pid ! squirrel.

%% States

bark() ->
    io:format("Dog says: BARK! BARK!~n"),
    receive
        pet ->
            wag_tail();
        _ ->
            io:format("Dog is confused~n"),
            bark()
    after 2000 ->
            bark()
    end.

wag_tail() ->
    io:format("Dog wags its tail~n"),
    receive
        pet ->
            sit();
        _ ->
            io:format("Dog is confused~n"),
            bark()
    after 30000 ->
            bark()
    end.

sit() ->
    io:format("Dog is sitting~n"),
    receive
        squirrel ->
            bark();
        _ ->
            io:format("Dog is confused~n"),
            sit()
    end.
