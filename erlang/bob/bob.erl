-module(bob).
-export([response_for/1]).

response_for(Remark) ->
    response_for_shout(Remark, is_shout(Remark)).

response_for_shout(_, true) ->
    "Whoa, chill out!";
response_for_shout(Remark, false) ->
    response_for_silence(Remark, is_silence(Remark)).

response_for_silence(_, true) ->
    "Fine. Be that way!";
response_for_silence(Remark, false) ->
    response_for_question(Remark, is_question(Remark)).

response_for_question(_, true) ->
    "Sure.";
response_for_question(_, false) ->
    "Whatever.".

is_question(Remark) -> 
    $? == lists:last(Remark).

is_shout(Remark) ->
    Remark =:= string:to_upper(Remark) andalso
    Remark =/= string:to_lower(Remark).

is_silence(Remark) -> 
    silence_tokens(string:tokens(Remark, " ")).

silence_tokens([]) -> true;
silence_tokens(_) -> false.
