-module(converter).
-author("79513").


-export([to_rub/1,to_rub2/1,to_rub3/1]).


to_rub({usd,Amount}) ->
  io:format("Convert ~p to rub, amount ~p~n", [usd,Amount]),
  {ok,Amount * 75.5};
to_rub({euro,Amount}) ->
  io:format("Convert ~p to rub, amount ~p~n", [euro,Amount]),
  {ok,Amount * 80};
to_rub({lari,Amount}) ->
  io:format("Convert ~p to rub, amount ~p~n", [lari,Amount]),
  {ok,Amount * 29};
to_rub({peso,Amount}) ->
  io:format("Convert ~p to rub, amount ~p~n", [peso,Amount]),
  {ok,Amount * 3};
to_rub({krone,Amount}) ->
  io:format("Convert ~p to rub, amount ~p~n", [krone,Amount]),
  {ok,Amount * 10};
to_rub(Error) ->
  io:format("Cant convert to rub, amount ~p~n", [Error]),
  {error, badarg}.
to_rub2({_,Amount} = Arg) ->
  Result = case Arg of
             {usd,Amount} ->
               io:format("Convert ~p to rub, amount ~p~n", [usd,Amount]),
               {ok,Amount * 75.5};
             {euro,Amount} ->
               io:format("Convert ~p to rub, amount ~p~n", [euro,Amount]),
               {ok,Amount * 80};
             {lari,Amount} ->
               io:format("Convert ~p to rub, amount ~p~n", [lari,Amount]),
               {ok, Amount * 29};
             {peso,Amount} ->
               io:format("Convert ~p to rub, amount ~p~n", [peso,Amount]),
               {ok, Amount * 3};
             {krone,Amount} ->
               io:format("Convert ~p to rub, amount ~p~n", [krone,Amount]),
               {ok, Amount * 10};
             Error ->
               io:format("Cant convert to rub, error ~p~n", [Error]),
               {error, badarg}
           end,
  io:format("Converted ~p to rub, amount ~p, Result ~p~n",[usd,Amount,Result]),
  Result.

to_rub3(Arg) ->
  case Arg of
    {usd,Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [usd,Amount]),
      {ok,Amount * 75.5};
    {euro,Amount} when is_integer(Amount), Amount > 0->
      io:format("Convert ~p to rub, amount ~p~n", [euro,Amount]),
      {ok,Amount * 80};
    {lari,Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [lari,Amount]),
      {ok, Amount * 29};
    {peso,Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [peso,Amount]),
      {ok, Amount * 3};
    {krone,Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [krone,Amount]),
      {ok, Amount * 10};
    Error ->
      io:format("Cant convert to rub, error ~p~n", [Error]),
      {error, badarg}
  end.
