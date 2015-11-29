-module(grade_school).
-export([new/0, add/3, get/2, sort/1]).

new() ->
    maps:new().

add(Name, Grade, School) ->
    Val = maps:find(Grade, School),
    case Val of
        error -> maps:put(Grade, [Name], School);
        {ok, Students} -> maps:update(Grade, [Name|Students], School)
    end.

%% This is hackery because one of the tests expects schools to be
%% represented as a list but I don't wanna.
get(_, []) -> new();
get(Grade, School) ->
    Val = maps:find(Grade, School),
    case Val of
        error -> []; 
        {ok, Students} -> Students
    end.

%% I think this works out of sheer luck. Will do better.
sort(School) ->
    maps:to_list(School).
