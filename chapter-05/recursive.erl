-module(recursive).
-export([fac/1, fac_tail/1, len/1, len_tail/1]).

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


