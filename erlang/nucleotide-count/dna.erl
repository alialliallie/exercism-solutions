-module(dna).
-export([count/2, nucleotide_counts/1]).

count(Strand, [$G]) -> do_count(Strand, $G);
count(Strand, [$A]) -> do_count(Strand, $A);
count(Strand, [$T]) -> do_count(Strand, $T);
count(Strand, [$C]) -> do_count(Strand, $C);
count(_, Nuc) ->
    error("Invalid nucleotide", Nuc).

do_count(Strand, Nuc) ->
    length(lists:filter(fun (E) -> E =:= Nuc end, Strand)).

nucleotide_counts(Strand) -> 
    lists:map(fun (E) -> {E, count(Strand, E)} end, ["A", "T", "C", "G"]).
