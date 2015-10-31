-module(anagram).
-export([find/2]).

find(Word, Anagrams) -> find(Word, Anagrams, []).

find(_, [], Acc) -> lists:reverse(Acc);
find(Word, [H|Rest], Acc) ->
    Matches = anagram(Word, H),
    case Matches of 
        true -> find(Word, Rest, [H|Acc]);
        false -> find(Word, Rest, Acc)
    end.

anagram(Word, Anagram) -> 
    string:to_lower(Word) =/= string:to_lower(Anagram) andalso
    string:equal(lists:sort(string:to_lower(Word)),
                 lists:sort(string:to_lower(Anagram))).
