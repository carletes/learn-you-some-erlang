-module(fifo).
-export([new/0, push/2, pop/1, empty/1]).

new() ->
    {fifo, [], []}.

push({fifo, In, Out}, X) ->
    {fifo, [X|In], Out}.

pop({fifo, [], []}) ->
    erlang:error("empty fifo");
pop({fifo, In, [X|Out]}) ->
    {X, {fifo, In, Out}};
pop({fifo, In, []}) ->
    pop({fifo, [], lists:reverse(In)}).

empty({fifo, [], []}) ->
    true;
empty({fifo, _, _}) -> false.

