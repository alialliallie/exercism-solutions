-module(binary_string).
-export([to_decimal/1]).

to_decimal(Binary) ->
    {Decimal, _} = lists:foldr(fun to_bin/2, {0, 0}, Binary),
    Decimal.

to_bin($0, {Sum, Pos}) ->
    {Sum, Pos + 1};
to_bin($1, {Sum, Pos}) ->
    Exp = trunc(math:pow(2, Pos)),
    {Sum + Exp, Pos + 1};
to_bin(_, _) ->
    {0, 0}.
