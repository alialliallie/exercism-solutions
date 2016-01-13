-module(clock).
-export([create/2, to_string/1, is_equal/2, minutes_add/2, minutes_delete/2]).

% One day in minutes
-define(DAY, 1440).

create(H, M)
  when H >= 0, H < 24,
       M >= 0, M < 60 ->
    {clock, (H * 60) + M}.

to_string({clock, Minutes}) ->
    {H, M} = divmod(Minutes, 60),
    lists:flatten(io_lib:format("~2..0w:~2..0w", [H, M])).

is_equal({clock, M1}, {clock, M2}) ->
    M1 =:= M2.

minutes_add({clock, Minutes}, Add) ->
    minutes_clock(Minutes + Add).

minutes_delete({clock, Minutes}, Del) ->
    minutes_clock(Minutes - Del).

minutes_clock(Minutes) when Minutes >= ?DAY ->
    minutes_clock(Minutes - ?DAY);
minutes_clock(Minutes) when Minutes < 0 ->
    minutes_clock(?DAY + Minutes);
minutes_clock(Minutes) ->
    {clock, Minutes}.


divmod(X, Y) ->
    {X div Y, X rem Y}.
