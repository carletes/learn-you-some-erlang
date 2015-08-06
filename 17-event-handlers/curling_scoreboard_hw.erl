-module(curling_scoreboard_hw).

-export([add_point/1, next_round/0, set_teams/2, reset_board/0]).

add_point(Team) ->
    io:format("Scoreboard: increased score of team ~s by 1~n", [Team]).

next_round() ->
    io:format("Scoreboard: round over~n").

reset_board() ->
    io:format("Scoreboard: All teams are undefined and all scores are 0~n").

set_teams(TeamA, TeamB) ->
    io:format("Scoreboard: Team ~s vs. Team ~s~n", [TeamA, TeamB]).
