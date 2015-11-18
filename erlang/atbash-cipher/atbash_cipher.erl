-module(atbash_cipher).
-export([encode/1, decode/1]).

encode(Text) ->
    Letters = lists:filtermap(fun encode_char/1, string:to_lower(Text)),
    chunk(Letters).

% Mathy letter conversion
encode_char(Char) when Char >= $a, Char =< $z  ->
    {true, $z - (Char - $a)};
encode_char(Char) when Char >= $0, Char =< $9  ->
    {true, Char};
encode_char(_) ->
    false.

% Really basic there's probably something else that does this for me
chunk(Text) when length(Text) >= 5 ->
    {Chunk, Rest} = lists:split(5, Text),
    chunk(Rest, Chunk);
chunk(Text) ->
    Text.

chunk([], Acc) -> Acc;
chunk(Text, Acc) when length(Text) >= 5 ->
    {Chunk, Rest} = lists:split(5, Text),
    chunk(Rest, string:join([Acc, Chunk], " "));
chunk(Chunk, Acc) ->
    string:join([Acc, Chunk], " ").

decode(Text) ->
    lists:filtermap(fun encode_char/1, Text).

