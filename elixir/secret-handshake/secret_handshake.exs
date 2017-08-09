defmodule SecretHandshake do
  use Bitwise

  @command_flags %{
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
  }
  @reverse 16

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    if band(code, @reverse) == @reverse do
      Enum.flat_map(@command_flags, fn ({flag, _}) -> flagged(code, flag) end)
      |> Enum.reverse
    else
      Enum.flat_map(@command_flags, fn ({flag, _}) -> flagged(code, flag) end)
    end
  end

  def flagged(code, flag) when band(code, flag) == flag do
    [@command_flags[flag]]
  end

  def flagged(code, flag) when band(code, flag) != flag do
    []
  end
end

