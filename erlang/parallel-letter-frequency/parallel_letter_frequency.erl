-module(parallel_letter_frequency).
-export([dict/1]).
-export([counter/2]).

dict(Strings) ->
    spinup(Strings),
    accumulate(dict:new(), length(Strings)).

spinup(Strings) ->
    lists:foreach(fun (String) ->
                 spawn(?MODULE, counter, [self(), String])
               end, Strings).

counter(From, String) ->
    From ! {result, count_letters(String)}.

accumulate(Acc, 0) -> Acc;
accumulate(Acc, Expected) ->
    receive
        {result, Dict} -> 
            Dict1 = dict:merge(fun add_counts/3, Acc, Dict),
            accumulate(Dict1, Expected - 1)
    end.

count_letters(S) ->
    CountFn = fun (C, Acc) ->
                      dict:update_counter(C, 1, Acc)
              end,
    lists:foldl(CountFn, dict:new(), S).

add_counts(_, A, B) -> A + B.
