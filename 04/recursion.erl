
-module(recursion).
-author("79513").

-export([tail_fac/1, duplicate/1, tail_duplicate/1, tail_fac/2]).

tail_fac(N) when is_integer(N) ->
  tail_fac(N,1).
tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when is_integer(N) ->
  tail_fac(N-1, N*Acc).


duplicate([]) ->
  [];

duplicate([Head|Tail]) ->
  [Head|[Head|duplicate(Tail)]].

tail_duplicate([]) ->
  [];

tail_duplicate(List) when is_list(List) ->
  tail_duplicate(List, []).

tail_duplicate([], Acc) ->
  lists:reverse(Acc);

tail_duplicate([Head|Tail], Acc) ->
  tail_duplicate(Tail, [Head,Head|Acc]).