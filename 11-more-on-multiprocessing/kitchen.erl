-module(kitchen).
-export([fridge2/1, start/1, store/2, take/2]).

fridge2(FoodList) ->
    receive
        {From, {store, Food}} ->
            From ! {self(), ok},
            fridge2([Food | FoodList]);
        {From, {take, Food}} ->
            case lists:member(Food, FoodList) of
                true ->
                    From ! {self(), {ok, Food}},
                    fridge2(lists:delete(Food, FoodList));
                false ->
                    From ! {self(), {not_found, Food}} ,
                    fridge2(FoodList)
            end;
        terminate ->
            ok
    end.

start(FoodList) ->
    spawn(?MODULE, fridge2, [FoodList]).

store(Pid, Food) ->
    Pid ! {self(), {store, Food}},
    receive
        {Pid, Msg} -> Msg
    end.

take(Pid, Food) ->
    Pid ! {self(), {take, Food}},
    receive
        {Pid, Msg} -> Msg
    end.

