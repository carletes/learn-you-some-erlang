-module(exceptions).
-export([errors/1, exits/1, throws/1]).

throws(F) ->
    try F() of
        _ -> ok
    catch
        Throw ->
             {throw, caught, Throw}
    end.

errors(F) ->
    try F() of
        _ -> ok
    catch
        error:Error ->
            {error, caught, Error}
    end.

exits(F) ->
    try F() of
        _ -> ok
    catch
        exit:Exit ->
            {exit, caught, Exit}
    end.
            
