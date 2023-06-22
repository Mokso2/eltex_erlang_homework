-module(keylist).
-author("79513").


-export([loop/1, start/1, start_link/1]).

-include("state.hrl").

start(Name) ->
  Pid = spawn(keylist,loop, [#state{}]),
  register(Name,Pid),
  MonitorRef = monitor(process,Pid),
  {ok,Pid,MonitorRef}.

start_link(Name) ->
  Pid = spawn_link(keylist,loop,[#state{}]),
  register(Name,Pid),
  Pid.

loop(#state{list = List, counter = Counter} = State) ->

  receive
    {From, add, Key, Value, Comment} ->
      NewState = State#state{list = [{Key, Value, Comment} | List], counter = Counter + 1},
      From ! {ok, NewState#state.counter},
      loop(NewState);
    {From, is_member, Key} ->
      NewState = State#state{counter = Counter + 1},
      lists:keymember({Key, 1, List}),
      From ! {ok, NewState#state.counter},
      loop(NewState);
    {From, take, Key} ->
      NewState = State#state{list  = lists:keytake(Key,1,List), counter = Counter + 1},
      From ! {ok, NewState#state.counter},
      loop(NewState);
    {From,find,Key} ->
      NewState = State#state{counter = Counter + 1},
      lists:keyfind(Key,1,List),
      From ! {ok,NewState#state.counter};
    {From,delete,Key} ->
      NewState = State#state{list = lists:keydelete(Key, 1, List),counter = Counter + 1},
      From ! {ok,NewState#state.counter}
end.

