-module(strain).
-export([keep/2, discard/2]).

keep(F, List) ->
    keep(F, List, []).

keep(_, [], Acc) -> lists:reverse(Acc);
keep(F, [H|T], Acc) ->
    Keep = F(H),
    case Keep of
        true -> keep(F, T, [H|Acc]);
        false -> keep(F, T, Acc)
    end.

discard(F, List) -> keep(fun(X) -> not F(X) end, List).
