-module(gigasecond).
-export([from/1]).

-define(GIGA, 1000000000).

-spec from(calendar:datetime()) -> calendar:datetime();
          (calendar:date()) -> calendar:datetime().
from({{_Y, _M, _D}, {_H, _I, _S}} = Datetime) ->
    giga(Datetime);
from({Y, M, D}) ->
    giga({{Y, M, D}, {0, 0, 0}}).

-spec giga(calendar:datetime()) -> calendar:datetime().
giga(Datetime) ->
    Ss = calendar:datetime_to_gregorian_seconds(Datetime),
    Gs = Ss + ?GIGA,
    calendar:gregorian_seconds_to_datetime(Gs).

