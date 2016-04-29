-module(meetup).
-export([schedule/4]).

schedule(Year, Month, Weekday, teenth) ->
    teenthday(Year, Month, weekday_to_integer(Weekday));
schedule(Year, Month, Weekday, first) ->
    nth(Year, Month, weekday_to_integer(Weekday), 1);
schedule(Year, Month, Weekday, second) ->
    nth(Year, Month, weekday_to_integer(Weekday), 2);
schedule(Year, Month, Weekday, third) ->
    nth(Year, Month, weekday_to_integer(Weekday), 3);
schedule(Year, Month, Weekday, fourth) ->
    nth(Year, Month, weekday_to_integer(Weekday), 4);
schedule(Year, Month, Weekday, last) ->
    last(Year, Month, weekday_to_integer(Weekday)).

%% Find the first occurrance of the weekday in the month and then add a number
%% of weeks. This is fine because all months have at least 28 days!
nth(Year, Month, Weekday, N) ->
    D = first_day(Year, Month, Weekday, lists:seq(1, 7)),
    Offset = 7 * (N - 1),
    {Year, Month, D + Offset}.

teenthday(Year, Month, Weekday) ->
    Date = first_day(Year, Month, Weekday, lists:seq(13, 19)),
    {Year, Month, Date}.

%% Walk backwards from the end of the month until we hit the desired weekday.
last(Year, Month, Weekday) ->
    Date = first_day(Year, Month, Weekday, last_days(Year, Month)),
    {Year, Month, Date}.

%% Find the first day of a given week
first_day(Year, Month, Weekday, Dates) -> 
    first(fun (D) ->
                  Weekday =:= calendar:day_of_the_week({Year, Month, D})
          end, Dates).

%% Detect first item that matches Fn. This probably exists maybe?
first(_, []) ->
    {error, nomatch};
first(Fn, [H|T]) ->
    case apply(Fn, [H]) of
        true -> H;
        false -> first(Fn, T)
    end.

%% Last 7 days of each month
last_days(Y, M) ->
    LastDay = calendar:last_day_of_the_month(Y, M),
    lists:seq(LastDay, (LastDay - 7), -1).
    
%% Data: weekday symbol to numeric
weekday_to_integer(monday) -> 1;
weekday_to_integer(tuesday) -> 2;
weekday_to_integer(wednesday) -> 3;
weekday_to_integer(thursday) -> 4;
weekday_to_integer(friday) -> 5;
weekday_to_integer(saturday) -> 6;
weekday_to_integer(sunday) -> 7.
