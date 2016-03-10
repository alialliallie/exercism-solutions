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
allergies(Total) ->
    lists:foldl(fun ({Name, Flag}, Acc) ->
                        allergic_if((Flag band Total) =:= Flag, Acc, Name)
                end, [], ?Allergies).

allergic_if(true, Acc, Name) -> Acc ++ [Name];
allergic_if(false, Acc, _) -> Acc.

is_allergic_to(Name, Total) ->
    Flag = proplists:get_value(Name, ?Allergies),
    (Flag band Total) =:= Flag.
