defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    number
    |> add_tens("")
  end

  @spec add_ones(pos_integer, String.t()) :: String.t()
  def add_ones(number, string) when number in 1..3 do
    string <> String.duplicate("I", number)
  end

  def add_ones(_number, string), do: string

  @spec add_fives(pos_integer, String.t()) :: String.t()
  def add_fives(number, string) when number in 4..8 do
    case number do
      4 -> string <> "IV"
      _5 -> string <> "V" <> add_ones(rem(number, 5), string)
    end
  end

  def add_fives(number, string), do: add_ones(number, string)

  @spec add_tens(pos_integer, String.t()) :: String.t()
  def add_tens(number, string) when number in 9..39 do
    tens = div(number, 10)

    case number do
      9 -> string <> "IX"
      _10 -> string <> String.duplicate("X", tens) <> add_tens(rem(number, 10), string)
    end
  end

  def add_tens(number, string), do: add_fives(number, string)
end
