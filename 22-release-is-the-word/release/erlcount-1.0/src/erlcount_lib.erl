-module(erlcount_lib).
-include_lib("kernel/include/file.hrl").

-export([find_erl/1, regex_count/2]).

%% Public API

find_erl(Directory) ->
    find_erl(Directory, queue:new()).

regex_count(Re, Str) ->
    case re:run(Str, Re, [global]) of
        nomatch -> 0;
        {match, List} -> length(List)
    end.

%% Private functions

find_erl(Name, Queue) ->
    {ok, F=#file_info{}} = file:read_file_info(Name),
    case F#file_info.type of
        directory ->
            handle_directory(Name, Queue);
        regular ->
            handle_regular_file(Name, Queue);
        _ -> dequeue_and_run(Queue)
    end.

handle_directory(Dir, Queue) ->
    case file:list_dir(Dir) of
        {ok, []} ->
            dequeue_and_run(Queue);
        {ok, Files} ->
            dequeue_and_run(enqueue_many(Dir, Files, Queue))
    end.

handle_regular_file(Name, Queue) ->
    case filename:extension(Name) of
        ".erl" ->
            {continue, Name, fun() -> dequeue_and_run(Queue) end};
        _ ->
            dequeue_and_run(Queue)
    end.

dequeue_and_run(Queue) ->
    case queue:out(Queue) of
        {empty, _} ->
            done;
        {{value, File}, NewQueue} ->
            find_erl(File, NewQueue)
    end.

enqueue_many(Path, Files, Queue) ->
    F = fun(File, Q) -> queue:in(filename:join(Path, File), Q) end,
    lists:foldl(F, Queue, Files).
