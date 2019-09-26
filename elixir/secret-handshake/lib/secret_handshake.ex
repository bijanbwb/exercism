defmodule SecretHandshake do
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
    code
    |> Integer.digits(2)
    |> Enum.reverse()
    |> Enum.zip(1..5)
    |> Enum.map(&bit_translation/1)
    |> Enum.reject(&is_nil/1)

    # TODO: If position 5 is 1, reverse list
  end

  @spec bit_translation({0 | 1, 1..5}) :: (integer -> String.t()) | nil
  defp bit_translation({bit_value, position}) do
    case bit_value do
      0 -> nil
      1 -> translate(position)
    end
  end

  @spec translate(integer) :: String.t()
  defp translate(position) do
    case position do
      1 -> "wink"
      2 -> "double blink"
      3 -> "close your eyes"
      4 -> "jump"
      5 -> nil
    end
  end
end
