-module(triangle).
-export([kind/3]).

kind(A, B, C) when A =< 0 orelse 
                   B =< 0 orelse 
                   C =< 0 ->
    {error, "all side lengths must be positive"};
kind(A, B, C) when A + B =< C orelse 
                   A + C =< B orelse 
                   B + C =< A->
    {error, "side lengths violate triangle inequality"};

kind(_A, _A, _A) -> equilateral;

kind(_A, _B, _B) -> isosceles;
kind(_B, _B, _A) -> isosceles;
kind(_B, _A, _B) -> isosceles;

kind(_, _, _) -> scalene.
