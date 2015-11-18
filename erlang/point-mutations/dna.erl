-module(dna).
-export([hamming_distance/2]).

hamming_distance(L, R) -> 
    hamming_distance(lists:zip(L, R)).

hamming_distance(Zip) ->
    length(lists:filter(fun({L, R}) ->
                               L =/= R
                        end, Zip)).
