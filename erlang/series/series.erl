-module(series).
-export([from_string/2]).

from_string(Size, String)
    -> lists:reverse(from_string(Size, String, [])).

from_string(Size, String, Acc) when length(String) < Size ->
    Acc;
from_string(Size, String, Acc) ->
    Substring = lists:sublist(String, Size),
    from_string(Size, lists:nthtail(1, String), [Substring|Acc]).
