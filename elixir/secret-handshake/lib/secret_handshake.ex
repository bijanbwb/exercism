defmodule SecretHandshake do
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    binary_digits = Integer.digits(code, 2)

    case check_reverse_bit(binary_digits) do
      true -> binary_digits |> generate_handshake() |> Enum.reverse()
      false -> binary_digits |> generate_handshake()
    end
  end

  @spec generate_handshake([0 | 1]) :: [String.t()]
  defp generate_handshake(binary_digits) do
    binary_digits
    |> Enum.reverse()
    |> Enum.zip(1..5)
    |> Enum.map(&bit_translation/1)
    |> Enum.reject(&is_nil/1)
  end

  @spec check_reverse_bit([0 | 1]) :: boolean
  defp check_reverse_bit(binary_digits) do
    Enum.count(binary_digits) == 5 and Enum.at(binary_digits, 0) == 1
  end

  @spec bit_translation({0 | 1, 1..5}) :: nil | (integer -> String.t())
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
