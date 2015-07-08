-module(tree).
-export([empty/0, insert/3, lookup/2]).

empty() ->
    {node, 'nil'}.

insert(K, V, {node, 'nil'}) ->
    {node, {K, V, {node, 'nil'}, {node, 'nil'}}};
insert(NewK, NewV, {node, {K, V, Smaller, Larger}}) when NewK < K->
    {node, {K, V, insert(NewK, NewV, Smaller), Larger}};
insert(NewK, NewV, {node, {K, V, Smaller, Larger}}) when NewK > K ->
    {node, {K, V, Smaller, insert(NewK, NewV, Larger)}};
insert(K, V, {node, {K, _, Smaller, Larger}}) ->
    {node, {K, V, Smaller, Larger}}.

lookup(_, {node, 'nil'}) ->
    undefined;
lookup(K, {node, {K, V, _, _}}) ->
    {ok, V};
lookup(K, {node, {NodeK, _, Smaller, _}}) when K < NodeK ->
    lookup(K, Smaller);
lookup(K, {node, {_, _, _, Larger}}) ->
    lookup(K, Larger).




              

