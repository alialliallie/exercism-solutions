-module(dna).
-export([hamming_distance/2]).

hamming_distance(A, B) -> 
    length(lists:filter(fun ({X, Y}) -> X =/= Y end, lists:zip(A, B))).
