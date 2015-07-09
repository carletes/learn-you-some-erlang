-module(calc).
-export([rpn/1, rpn_test/0]).

rpn(L) when is_list(L) ->
    [Res] = lists:foldl(fun rpn/2, [], string:tokens(L, " ")),
    Res.

rpn("+", [N1, N2 | S]) ->
    [N1 + N2 | S];
rpn(X, Stack) ->
    [read(X) | Stack].

read(N) ->
    case string:to_float(N) of
        {error, no_float} ->
            list_to_integer(N);
        {F, _} -> F
    end.

rpn_test() ->
    42 = rpn("42"),
    42.0 = rpn("42.0"),
    ok = try
             rpn("not-a-number")
         catch
             error:badarg -> ok
         end,
    42 = rpn("41 1 +"),
    ok = try
             rpn("0 41 1 +")
         catch
             error:{badmatch, _} -> ok
         end,
    ok.
