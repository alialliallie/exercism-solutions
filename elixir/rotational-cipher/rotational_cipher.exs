defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist
    |> Enum.map(&(encode_char(&1, shift)))
    |> to_string()
  end

  def encode_char(c, shift) when c >= ?a and c <= ?z do
    shift_by(c, shift, ?a)
  end

  def encode_char(c, shift) when c >= ?A and c <= ?Z do
    shift_by(c, shift, ?A)
  end

  def encode_char(c, _) do
    c
  end

  def shift_by(c, shift, base) do
    base_a = c - base
    shifted = rem(base_a + shift, 26)
    base + shifted
  end
end

