-module(allergies).
-export([allergies/1, is_allergic_to/2]).

-define(Allergies, 
        [{'eggs', 1},
         {'peanuts', 2},
         {'shellfish', 4},
         {'strawberries', 8},
         {'tomatoes', 16},
         {'chocolate', 32},
         {'pollen', 64},
         {'cats', 128}]).

allergies(0) -> [];
allergies(X) ->
    lists:foldl(fun ({N, V}, A) ->
                        Match = (V band X) =:= V,
                        case Match of
                             true -> A ++ [N];
                             false -> A
                        end
                end, [], ?Allergies).

is_allergic_to(N, X) -> 
    V = proplists:get_value(N, ?Allergies),
    (V band X) =:= V.
