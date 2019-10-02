defmodule SecretHandshake do
  @spec commands(code :: integer) :: [String.t()]
  def commands(code) do
    binary_digits = Integer.digits(code, 2)

    binary_digits
    |> Enum.reverse()
    |> Enum.zip(1..5)
    |> Enum.map(&bit_translation/1)
    |> Enum.reject(&is_nil/1)
    |> reversal(binary_digits)
  end

  @spec bit_translation({0 | 1, 1..5}) :: nil | (integer -> String.t())
  defp bit_translation({bit_value, position}) when bit_value == 1, do: translate(position)
  defp bit_translation(_tuple), do: nil

  @spec translate(integer) :: String.t()
  defp translate(position) when position == 1, do: "wink"
  defp translate(position) when position == 2, do: "double blink"
  defp translate(position) when position == 3, do: "close your eyes"
  defp translate(position) when position == 4, do: "jump"
  defp translate(_position), do: nil

  @spec reversal([String.t()], [0 | 1]) :: [String.t()]
  defp reversal(translated_list, [1 | tail]) when length(tail) == 4 do
    Enum.reverse(translated_list)
  end

  defp reversal(translated_list, _binary_digits), do: translated_list
end
