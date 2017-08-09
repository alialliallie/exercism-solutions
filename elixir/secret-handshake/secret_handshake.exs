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
    is_reverse = band(code, @reverse) == @reverse
    actions = Enum.reduce(@command_flags, [],
                          SecretHandshake.reducer(code, is_reverse))
  end

  def reducer(code, reverse) when reverse do
    fn (x, xs) -> SecretHandshake.add_action(:prepend, code, x, xs) end
  end

  def reducer(code, reverse) do
    fn (x, xs) -> SecretHandshake.add_action(:append, code, x, xs) end
  end

  def add_action(:prepend, code, {flag, action}, acc) when band(code, flag) == flag do
    [action] ++ acc
  end

  def add_action(:append, code, {flag, action}, acc) when band(code, flag) == flag do
    acc ++ [action]
  end

  def add_action(_, _, _, acc) do
    acc
  end
end

