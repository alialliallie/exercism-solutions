-module(beer_song).
-export([verse/1, sing/1, sing/2]).

verse(0) ->
    "No more bottles of beer on the wall, no more bottles of beer.\n"
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n";
verse(1) ->
    "1 bottle of beer on the wall, 1 bottle of beer.\n"
    "Take it down and pass it around, no more bottles of beer on the wall.\n";
verse(2) ->
    "2 bottles of beer on the wall, 2 bottles of beer.\n"
    "Take one down and pass it around, 1 bottle of beer on the wall.\n";
verse(N) -> 
    io_lib:format("~B bottles of beer on the wall, ~B bottles of beer.\n"
    "Take one down and pass it around, ~B bottles of beer on the wall.\n", 
    [N, N, N-1]).

sing(Start) ->
    sing(Start, 0).

sing(Start, End) ->
    lists:reverse(lists:map(fun (V) -> verse(V) ++ ["\n"] end,
                            lists:seq(End, Start))).
