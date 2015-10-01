-module(rna_transcription).
-export([to_rna/1]).

to_rna(Seq) ->
    lists:map(fun convert/1, Seq).

convert($G) -> $C;
convert($C) -> $G;
convert($T) -> $A;
convert($A) -> $U.
