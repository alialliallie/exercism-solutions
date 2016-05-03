-module(space_age).
-export([ageOn/2]).

ageOn(earth,   Seconds) -> age_ratio(Seconds, 1);
ageOn(mercury, Seconds) -> age_ratio(Seconds, 0.2408467);
ageOn(venus,   Seconds) -> age_ratio(Seconds, 0.61519726);
ageOn(mars,    Seconds) -> age_ratio(Seconds, 1.8808158);
ageOn(jupiter, Seconds) -> age_ratio(Seconds, 11.862615);
ageOn(saturn,  Seconds) -> age_ratio(Seconds, 29.447498);
ageOn(uranus,  Seconds) -> age_ratio(Seconds, 84.016846);
ageOn(neptune, Seconds) -> age_ratio(Seconds, 164.79132);
ageOn(_, _) -> error.

age_ratio(Seconds, Ratio) ->
    (Seconds / (31557600 * Ratio)).
