-module(robot_simulator).
-export([create/0, direction/1, position/1,
         place/3, control/2,
         left/1, right/1, advance/1,
         % I don't understand why I have to export this for it to work
         robot/1]).

robot(State) ->
    receive
        {From, place, {Facing, Position}} ->
            From ! {self(), ok},
            robot({Facing, Position});
        {From, state} ->
            From ! {self(), State},
            robot(State);
        {From, left} ->
            From ! {self(), ok},
            robot(turn(left, State));
        {From, right} ->
            From ! {self(), ok},
            robot(turn(right, State));
        {From, advance} ->
            From ! {self(), ok},
            robot(forward(State));
        _ ->
            exit(error)
    end.

turn(left, {north, Position}) -> {west, Position};
turn(left, {east, Position}) -> {north, Position};
turn(left, {south, Position}) -> {east, Position};
turn(left, {west, Position}) -> {south, Position};
turn(right, {north, Position}) -> {east, Position};
turn(right, {east, Position}) -> {south, Position};
turn(right, {south, Position}) -> {west, Position};
turn(right, {west, Position}) -> {north, Position}.

forward({north, {X, Y}}) -> {north, {X, Y + 1}};
forward({south, {X, Y}}) -> {south, {X, Y - 1}};
forward({east, {X, Y}}) -> {east, {X + 1, Y}};
forward({west, {X, Y}}) -> {west, {X - 1, Y}}.

create() ->
    spawn(?MODULE, robot, [{undefined, {undefined, undefined}}]).

place(Robot, Facing, Position) ->
    Robot ! {self(), place, {Facing, Position}},
    receive
        {Robot, ok} -> ok
    end.

direction(Robot) ->
    Robot ! {self(), state},
    receive
        {Robot, {Facing, _}} -> Facing
    end.

position(Robot) ->
    Robot ! {self(), state},
    receive
        {Robot, {_, Position}} -> Position
    end.

left(Robot) ->
    Robot ! {self(), left},
    receive
        {Robot, ok} -> ok
    end.

right(Robot) ->
    Robot ! {self(), right},
    receive
        {Robot, ok} -> ok
    end.

advance(Robot) ->
    Robot ! {self(), advance},
    receive
        {Robot, ok} -> ok
    end.

control(Robot, Plan) ->
    Commands = parse(Plan),
    run(Robot, Commands).

run(_, []) -> ok;
run(Robot, [C|Rest]) ->
    Robot ! {self(), C},
    run(Robot, Rest).

parse(Plan) ->
    try 
        lists:map(fun plan_to_command/1, Plan)
    catch 
        bad_command -> []
    end.


plan_to_command($R) -> right;
plan_to_command($L) -> left;
plan_to_command($A) -> advance;
plan_to_command(_) -> throw(bad_command).
