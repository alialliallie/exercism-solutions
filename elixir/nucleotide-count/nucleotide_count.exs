defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Map.get(histogram(strand), nucleotide)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    counts = strand
             |> Enum.group_by(fn(x) -> x end)
             |> Enum.map(fn({k,v}) -> {k, length(v)} end)
             |> Map.new
    Map.merge(%{?A => 0, ?T => 0, ?C => 0, ?G => 0}, counts)
  end
end
