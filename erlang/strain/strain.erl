-module(strain).
-export([keep/2, discard/2]).

keep(F, List) ->
    keep(F, List, []).

keep(_, [], Acc) -> lists:reverse(Acc);
keep(F, [H|T], Acc) -> keep_if(F(H), F, [H|T], Acc).

keep_if(true, F, [H|T], Acc) -> keep(F, T, [H|Acc]);
keep_if(false, F, [_|T], Acc) -> keep(F, T, Acc).

discard(F, List) -> keep(fun(X) -> not F(X) end, List).
