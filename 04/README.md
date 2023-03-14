31> rr("conv_info.hrl").
[conv_info]
32> c(converter).
{ok,converter}
33> converter:rec_to_rub(#conv_info{type = usd, amount = 100, commission = 0.01}).
{ok,7474.5}
34> converter:rec_to_rub(#conv_info{type = peso, amount = 12, commission = 0.02}).
{ok,35.28}
35> converter:rec_to_rub(#conv_info{type = yene, amount = 30, commission = 0.02}).
Can’t convert to rub, error {conv_info,yene,30,0.02}
{error,badarg}
36> converter:rec_to_rub(#conv_info{type = euro, amount = -15, commission = 0.02}).
Can’t convert to rub, error {conv_info,euro,-15,0.02}
{error,badarg}
37> converter: map_to_rub(#{type => usd, amount => 100, commission => 0.01}).
{ok,7474.5}
38> converter: map_to_rub(#{type => peso, amount => 12, commission => 0.02}).
{ok,35.28}
39> converter: map_to_rub(#{type => yene, amount => 30, commission => 0.02}).
Can’t convert to rub, error #{amount => 30,commission => 0.02,type => yene}
{error,badarg}
40> converter: map_to_rub(#{type => euro, amount => -15, commission => 0.02}).
Can’t convert to rub, error #{amount => -15,commission => 0.02,type => euro}
{error,badarg}
3> c(recursion).
{ok,recursion}
4> recursion:tail_fac(10).
3628800
5> recursion:tail_fac(0).
1
6> recursion:duplicate([1,2,3]).
[1,1,2,2,3,3]
7> recursion:duplicate([]).
[]
8> recursion:tail_duplicate([1,2,3]).
[1,1,2,2,3,3]
9> recursion:tail_duplicate([]).
[]
10> Fac = fun recursion:tail_fac/1.
fun recursion:tail_fac/1
11> Fac(10).
3628800
12> Duplicate = fun recursion:tail_duplicate/1.
fun recursion:tail_duplicate/1
13> Duplicate([1,2,3]).
[1,1,2,2,3,3]
14> ToRub = fun ({usd,Amount}) when Amount > 0 -> {ok, Amount * 75.5}; ({euro,Amount}) when Amount > 0 -> {euro, Amount* 80}; ({peso,Amount}) when Amount > 0 -> {peso, Amount * 3}; ({lari,Amount}) when Amount > 0 -> {lari, Amount* 29}; ({krone,Amount}) when Amount > 0 -> {krone, Amount* 10}; (Error) -> {error,badarg} end.
#Fun<erl_eval.42.3316493>
15> ToRub({usd,100}).
{ok,7550.0}
16> ToRub({peso,12}).
{peso,36}
17> ToRub({yene,30}).
{error,badarg}
18> ToRub({euro,-15}).
{error,badarg}

Вывод: В ходе выполнения получил правктические навыки работы ипользования рекодров и мап в функция, рекурсивных функций, хвостовых рекурсивных функций, а так же алиасов и анонимных функций.
