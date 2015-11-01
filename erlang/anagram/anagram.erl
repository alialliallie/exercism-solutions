-module(anagram).
-export([find/2]).

find(Word, Anagrams) -> 
    lists:filter(anagram_of(Word), Anagrams).

anagram_of(Word) -> 
    fun (Anagram) ->
            string:to_lower(Word) =/= string:to_lower(Anagram) andalso
            string:equal(lists:sort(string:to_lower(Word)),
                         lists:sort(string:to_lower(Anagram)))
    end.
