-module(luhn).
-export([valid/1, create/1]).

valid(Number) -> luhn_checksum(Number) =:= 0.

create(Base) ->
    first_valid(Base, lists:seq($0, $9)).

first_valid(Base, [Check|T]) ->
    Candidate = lists:append(Base, [Check]),
    case luhn_checksum(Candidate) of
        0 -> Candidate;
        _ -> first_valid(Base, T)
    end.

luhn_checksum(Number) ->
    {Luhn, _} = lists:foldr(fun luhn_checksum/2, {0, 0}, Number),
    Luhn rem 10.

luhn_checksum(Digit, {Sum, Pos}) when Digit >= $0, Digit =< $9->
    Int = luhn_digit(Digit - $0, Pos),
    {Sum + Int, Pos +1};
luhn_checksum(_, Acc) -> Acc.

luhn_digit(Int) when Int >= 10 ->
    Int - 9;
luhn_digit(Int) -> Int.

luhn_digit(Int, Pos) when Pos rem 2 =:= 1 ->
    luhn_digit(Int * 2);
luhn_digit(Int, _) -> Int.

