-module(sum_of_multiples).
-export([sumOfMultiples/2, sumOfMultiplesDefault/1]).

sumOfMultiplesDefault(N) -> sumOfMultiples([3,5], N).

sumOfMultiples(Multiples, N) ->
    lists:sum(only_factors(Multiples, N)).

only_factors(Multiples, N) ->
    lists:filter(factor(Multiples), lists:seq(1, N - 1)).

factor(Multiples) ->
    fun (N) ->
            lists:any(fun (M) -> N rem M =:= 0 end, Multiples)
    end.
