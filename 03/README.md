3> converter:to_rub({usd,100}).
Convert usd to rub, amount 100
{ok,7550.0}
4> converter:to_rub({peso,12}).
Convert peso to rub, amount 12
{ok,36}
5> converter:to_rub({yene,30}).
Cant convert to rub, amount {yene,30}
{error,badarg}
6> converter:to_rub({euro,-15}).
Convert euro to rub, amount -15
{ok,-1200}
Convert usd to rub, amount 100
Converted usd to rub, amount 100, Result {ok,7550.0}
{ok,7550.0}
7> converter:to_rub2({peso,12}).
Convert peso to rub, amount 12
Converted usd to rub, amount 12, Result {ok,36}
{ok,36}
8> converter:to_rub2({yene,30}).
Cant convert to rub, error {yene,30}
Converted usd to rub, amount 30, Result {error,badarg}
{error,badarg}
9> converter:to_rub2({euro,-15}).
Convert euro to rub, amount -15
Converted usd to rub, amount -15, Result {ok,-1200}
{ok,-1200}
10> converter:to_rub3({usd,100}).
Convert usd to rub, amount 100
{ok,7550.0}
11> converter:to_rub3({peso,12}).
Convert peso to rub, amount 12
{ok,36}
12> converter:to_rub3({yene,30}).
Cant convert to rub, error {yene,30}
{error,badarg}
13> converter:to_rub3({euro,-15}).
Cant convert to rub, error {euro,-15}
{error,badarg}

Вывод: Входе выполнения работы получил практические навыки работы с функциями, case, охранными выражениями и конечно работа с Git. В целом с функциями все достаточно легко и понятно, как и с остальным материалом.
