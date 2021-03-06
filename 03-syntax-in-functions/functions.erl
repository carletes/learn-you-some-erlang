-module(functions).
-export([head/1, old_enough/1, right_age/1, same/2, second/1]).

head([X|_]) -> X.

second([_,X|_]) -> X.

same(X, X) ->
    true;
same(_, _) ->
    false.

old_enough(X) when X >= 16 ->
    true;
old_enough(_) -> false.

right_age(X) when X >= 16, X =< 104 ->
    true;
right_age(_) -> false.

