-module(dna).
-export([hamming_distance/2]).

hamming_distance(L, R) -> 
    hamming_distance(L, R, 0).

hamming_distance([], [], Acc) -> Acc;
hamming_distance(_,  [], Acc) -> Acc;
hamming_distance([],  _, Acc) -> Acc;
hamming_distance([LH|LT], [RH|RT], Acc) when LH =/= RH ->
    hamming_distance(LT, RT, Acc + 1);
hamming_distance([LH|LT], [RH|RT], Acc) ->
    hamming_distance(LT, RT, Acc).
