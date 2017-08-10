defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) do
    Enum.reverse(do_keep(list, fun, []))
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    keep(list, fn (x) -> not fun.(x) end)
  end

  def do_keep([], _, acc) do
    acc
  end

  def do_keep([h|t], fun, acc) do
    if fun.(h) do
      do_keep(t, fun, [h|acc])
    else
      do_keep(t, fun, acc)
    end
  end
end
