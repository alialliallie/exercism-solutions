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
allergies(Subject) ->
    lists:reverse(lists:foldl(allergy_reducer(Subject), [], ?Allergies)).

allergy_reducer(Subject) ->
    fun ({Allergen, Flag}, Acc) ->
            add_allergy(Flag band Subject, Acc, Allergen)
    end.


add_allergy(0, A, _) -> A;
add_allergy(_, A, N) -> [N|A].

is_allergic_to(Name, Total) ->
    Flag = proplists:get_value(Name, ?Allergies),
    (Flag band Total) =:= Flag.
