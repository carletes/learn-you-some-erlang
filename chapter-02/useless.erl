-module(useless).
-export([add/2, greet_and_add_two/1, hello/0]).

add(A, B) ->
    A + B.

%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
    io:format("Hello, World!~n").

greet_and_add_two(X) ->
    hello(),
    add(X, 2).
