-module(exceptions).
-export([throws/1]).

throws(F) ->
    try F() of
        _ -> ok
    catch
        Throw ->
             {throw, caught, Throw}
    end.
