-module(hhfuns).
-export([add/2, decrement/1, filter/2, increment/1, map/2, one/0, two/0]).

one() -> 1.

two() -> 2.

add(X, Y) ->
    X() + Y().

map(_, []) ->
    [];
map(F, [H|T]) ->
    [F(H)|map(F, T)].

increment(L) -> map(fun(X) -> X + 1 end, L).

decrement(L) -> map(fun(X) -> X - 1 end, L).

filter(P, L) ->
    lists:reverse(filter(P, L, [])).
filter (_, [], Acc) ->
    Acc;
filter (P, [H|T], Acc) ->
    case P(H) of
        true ->
            filter(P, T, [H|Acc]);
        false ->
            filter(P, T, Acc)
    end.

