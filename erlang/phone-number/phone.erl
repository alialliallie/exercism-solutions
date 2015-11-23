-module(phone).
-export([number/1, areacode/1, pretty_print/1]).

number(Num) ->
    simplify(clean_number(Num)).

areacode(Num) ->
    lists:sublist(number(Num), 3).

pretty_print(Num) ->
    Phone = number(Num),
    Area = areacode(Num),
    Prefix = string:sub_string(Phone, 4, 6),
    Line = string:sub_string(Phone, 7),
    "(" ++ Area ++ ") " ++ Prefix ++ "-" ++ Line.

% Handle length/1-prefix validation
simplify(Num) when length(Num) =:= 10 -> Num;
simplify([$1|Num]) when length(Num) =:= 10 -> Num;
simplify(_) -> "0000000000".

% Strip non-digits
clean_number(Num) ->
    [X || X <- Num, X >= $0, X =< $9].
