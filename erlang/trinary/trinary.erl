-module(trinary).
-export([to_decimal/1]).

to_decimal(Trinary) ->
    {Decimal, _} = lists:foldr(fun to_tri/2, {0, 0}, Trinary),
    Decimal.

to_tri(D, {Sum, Pos}) when D >= $0, D =< $2 ->
    I = D - $0,
    Exp = I * trunc(math:pow(3, Pos)),
    {Sum + Exp, Pos + 1};
to_tri(_, _) ->
    {0, 0}.
