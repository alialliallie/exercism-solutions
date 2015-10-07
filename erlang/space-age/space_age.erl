-module(space_age).
-export([ageOn/2]).

ageOn(earth, Seconds) -> 
    seconds_in_years(Seconds);
ageOn(mercury, Seconds) ->
    seconds_in_years(Seconds) / 0.2408467;
ageOn(venus, Seconds) ->
    seconds_in_years(Seconds) / 0.61519726;
ageOn(mars, Seconds) ->
    seconds_in_years(Seconds) / 1.8808158;
ageOn(jupiter, Seconds) ->
    seconds_in_years(Seconds) / 11.862615;
ageOn(saturn, Seconds) ->
    seconds_in_years(Seconds) / 29.447498;
ageOn(uranus, Seconds) ->
    seconds_in_years(Seconds) / 84.016846;
ageOn(neptune, Seconds) ->
    seconds_in_years(Seconds) / 164.79132;
ageOn(_,_) ->
    error.

seconds_in_years(Seconds) -> 
    Seconds / 31557600.
