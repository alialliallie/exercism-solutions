-module(etl).
-export([transform/1]).

transform(Data) -> 
    lists:flatmap(fun transform_single/1, Data).

transform_single({Score, Letters}) ->
    lists:map(fun (L) -> {string:to_lower(L), Score} end, Letters).
