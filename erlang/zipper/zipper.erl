-module(zipper).

% Tree functions
-export([empty/0, new_tree/3]).

% Zipper functions
-export([from_tree/1, to_tree/1, left/1, right/1, up/1,
         value/1, set_value/2, set_left/2, set_right/2]).

% The tests assume `nil` is the empty node atom.
-type empty_node() :: nil.
-type value_node() :: {node, Value::any(), Left::tree(), Right::tree()}.
-type tree() :: value_node()
              | empty_node().
-type path_elem() :: {left, tree()} | {right, tree()}.
-type zipper() :: {zip, Path::[path_elem()], Subtree::tree()}.

-spec empty() -> tree().
empty() -> nil.

-spec new_tree(any(), tree(), tree()) -> tree().
new_tree(V, L, R) -> {node, V, L, R}.

-spec from_tree(tree()) -> zipper().
from_tree(T) -> {zip, [], T}.

% Recursively rebuild the tree by retracing previous steps
-spec to_tree(zipper()) -> tree().
to_tree({zip, [], Tree}) -> Tree;
to_tree({zip, [Step|Path], T}) ->
    to_tree({zip, Path, retrace_step(Step, T)}).

% Reconstruct the previous tree given a Step (left/right action) and the
% currently focused subtree.
-spec retrace_step(path_elem(), tree()) -> value_node().
retrace_step({_, nil}, Tree) -> Tree;
retrace_step({left, {node, V, _, R}}, Tree) ->
    new_tree(V, Tree, R);
retrace_step({right, {node, V, L, _}}, Tree) ->
    new_tree(V, L, Tree).

-spec left(zipper()) -> zipper() | empty_node().
left({zip, _Path, {node, _V, nil = L, _R}}) -> L;
left({zip, Path, {node, V, L, R}}) ->
    T = new_tree(V, empty(), R),
    {zip, [{left, T}|Path], L}.

-spec right(zipper()) -> zipper() | empty_node().
right({zip, _Path, nil = T}) -> T;
right({zip, Path, {node, V, L, R}}) ->
    T = new_tree(V, L, empty()),
    {zip, [{right, T}|Path], R}.

-spec up(zipper()) -> zipper() | empty_node().
up({zip, [], _T}) -> empty();
up({zip, [Step|Path], T}) -> {zip, Path, retrace_step(Step, T)}.

-spec value(zipper()) -> any().
value({zip, _Path, {node, V, _L, _R}}) -> V.

-spec set_value(zipper(), any()) -> zipper().
set_value({zip, Path, {node, _, L, R}}, NewValue) ->
    {zip, Path, {node, NewValue, L, R}}.

-spec set_left(zipper(), tree()) -> zipper().
set_left({zip, Path, {node, V, _, R}}, NewLeft) ->
    {zip, Path, {node, V, NewLeft, R}}.

-spec set_right(zipper(), tree()) -> zipper().
set_right({zip, Path, {node, V, L, _}}, NewRight) ->
    {zip, Path, {node, V, L, NewRight}}.
