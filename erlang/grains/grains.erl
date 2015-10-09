-module(grains).
-export([square/1, total/0]).

square(N) -> trunc(math:pow(2, N - 1)).

total() -> total(64).

total(Sq) -> total(Sq, 0).

total(0, Acc) -> Acc;
total(N, Acc) -> total(N - 1, Acc + square(N)).
