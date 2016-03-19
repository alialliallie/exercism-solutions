-module(largest_series_product).
-export([from_string/2]).

from_string(_, 0) -> 1;
from_string(String, Size) ->
    lists:max(products(all_series(String, Size))).

products(Series) ->
    lists:map(fun (S) ->
                      Is = lists:map(fun(C) -> C - $0 end, S),
                      lists:foldl(fun (I, P) -> I * P end, 1, Is)
              end, Series).

all_series(String, Size) -> lists:reverse(all_series(Size, String, [])).

all_series(Size, String, Acc) when length(String) < Size ->
    Acc;
all_series(Size, String, Acc) ->
    Substring = lists:sublist(String, Size),
    all_series(Size, lists:nthtail(1, String), [Substring|Acc]).
