-module(recursive).
-export([duplicate/2, fac/1, fac_tail/1, len/1, len_tail/1, reverse_tail/1, sublist_tail/2, zip_tail/2]).

fac(0) ->
    1;
fac(N) when N > 0 ->
    N * fac(N - 1).

fac_tail(N) ->
    fac_tail(N, 1).
fac_tail(0, Acc) ->
    Acc;
fac_tail(N, Acc) when N > 0->
    fac_tail(N - 1, N * Acc).

len([]) ->
    0;
len([_|T]) ->
    1 + len(T).

len_tail(X) ->
    len_tail(X, 0).
len_tail([], Acc) ->
    Acc;
len_tail([_|T], Acc) ->
    len_tail(T, Acc + 1).

duplicate(N, X) ->
    duplicate(N, X, []).
duplicate(0, _, Acc) ->
    Acc;
duplicate(N, X, Acc) when N > 0 ->
    duplicate(N - 1, X, [X|Acc]).

reverse_tail(L) ->
    reverse_tail(L, []).
reverse_tail([], Acc) ->
    Acc;
reverse_tail([H|T], Acc) ->
    reverse_tail(T, [H|Acc]).

sublist_tail(L, N) ->
    lists:reverse(sublist_tail(L, N, [])).
sublist_tail(_, 0, Acc) ->
    Acc;
sublist_tail([], _, Acc) ->
    Acc;
sublist_tail([H|T], N, Acc) when N > 0 ->
    sublist_tail(T, N - 1, [H|Acc]).

zip_tail(L, M) ->
    zip_tail(L, M, []).
zip_tail([], _, Acc) ->
    Acc;
zip_tail(_, [], Acc) ->
    Acc;
zip_tail([X|Xs], [Y|Ys], Acc) ->
    zip_tail(Xs, Ys, [{X, Y}|Acc]).


