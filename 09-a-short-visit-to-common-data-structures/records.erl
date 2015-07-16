-module(records).
-export([admin_panel/1, adult_section/1, car_factory/1, first_robot/0, repairman/1]).

-record(robot, {name,
                type=industrial,
                hobbies,
                details=[]}).
-record(user, {id, name, group, age}).

-include("records.hrl").

first_robot() ->
    #robot{name="Mechatron",
           type=handmade,
           details=["Moved by a small man inside"]}.

car_factory(CorpName) ->
    #robot{name=CorpName, hobbies="building cars"}.

admin_panel(#user{name=Name, group=admin}) ->
    Name ++ " is allowed!";
admin_panel(#user{name=Name}) ->
    Name ++ " is NOT allowed".

adult_section(U = #user{}) when U#user.age >= 18 ->
    allowed;
adult_section(_) ->
    forbidden.

repairman(R) ->
    Details = R#robot.details,
    NewR = R#robot{details=["Repaired by repairman" | Details]},
    {repaired, NewR}.
