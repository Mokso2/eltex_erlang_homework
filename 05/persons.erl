
-module(persons).

-include("person.hrl").

-export([filter/2, all/2, any/2, update/2, get_average_age/1]).
filter(Fun, Persons) -> lists:filter(Fun, Persons).

all(Fun, Persons) -> lists:all(Fun, Persons).

any(Fun, Persons) -> lists:any(Fun, Persons).

update(Fun, Persons) -> lists:map(Fun, Persons).

get_average_age(Persons) ->
  Result = lists:foldl(fun(P,{AgeSum, PersonsCount}) ->
    {P#person.age + AgeSum, PersonsCount + 1} end,
    {0,0},
    Persons),
    case Result of
      {AgeSum, PersonsCount} when PersonsCount > 0 ->
        Average = AgeSum / PersonsCount,
        {ok,Average};
        {_,_} ->
          {error,badarg}
    end.