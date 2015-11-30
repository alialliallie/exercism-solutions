-module(word_count).
-export([count/1]).

count(S) ->
    %% A little data-specific but ok with it
    Tokens = lists:map(fun string:to_lower/1, string:tokens(S, "!@#$%^&*()-_:;., ")),
    lists:foldl(fun word_count/2, dict:new(), Tokens).

word_count(W, Dict) ->
    case dict:find(W, Dict) of
         {ok, Count} -> dict:store(W, Count + 1, Dict);
         error -> dict:store(W, 1, Dict)
    end.
