-module(erlcount).
-behaviour(application).

-export([start/2, stop/1]).

%% Application callbacks

start(normal, _Args) ->
    erlcount_sup:start_link().

stop(_State) ->
    ok.
