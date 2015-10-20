-module(sum_of_multiples).
-export([sumOfMultiples/2, sumOfMultiplesDefault/1]).

sumOfMultiplesDefault(N) -> sumOfMultiples([3,5], N).

sumOfMultiples(Multiples, N) ->
    sumOfMultiples(Multiples, N - 1, 0).

sumOfMultiples(_, 0, Acc) -> Acc;
sumOfMultiples(Multiples, N, Acc) ->
    Factor = lists:any(fun (M) -> N rem M =:= 0 end, Multiples),
    sum_if(Factor, Multiples, N, Acc).

sum_if(true, Multiples, N, Acc) ->
    sumOfMultiples(Multiples, N - 1, Acc + N);
sum_if(false, Multiples, N, Acc) ->
    sumOfMultiples(Multiples, N - 1, Acc).
