defmodule RomanNumerals do
  @maximum_input 3000

  @doc """
  Convert a number to a roman numeral.

  This solution begins by translating any 1000s digits, which then make a call
  to translate any 500s, which make a call to translate 100s, etc. It works in
  the following order:

  ```
  1000s -> 500s -> 100s -> 50s -> 10s -> 5s -> 1s
  M     -> D    -> C    -> L   -> X   -> V  -> I
  ```

  The `numeral/1` function takes a single number as an input, and we use that
  to incrementally build up a string that will contain the translated roman
  numeral.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number), do: add_thousands(number, "")

  @spec add_thousands(pos_integer, String.t()) :: String.t()
  def add_thousands(number, string) when number in 1000..@maximum_input do
    string <> String.duplicate("M", div(number, 1000)) <> add_hundreds(rem(number, 1000), string)
  end

  def add_thousands(number, string) when number in 900..999 do
    string <> "CM" <> add_fifties(rem(number, 900), string)
  end

  def add_thousands(number, string), do: add_five_hundreds(number, string)

  @spec add_five_hundreds(pos_integer, String.t()) :: String.t()
  def add_five_hundreds(number, string) when number in 500..899 do
    string <> "D" <> add_hundreds(rem(number, 500), string)
  end

  def add_five_hundreds(number, string) when number in 400..499 do
    string <> "CD" <> add_fifties(rem(number, 400), string)
  end

  def add_five_hundreds(number, string), do: add_hundreds(number, string)

  @spec add_hundreds(pos_integer, String.t()) :: String.t()
  def add_hundreds(number, string) when number in 100..399 do
    string <> String.duplicate("C", div(number, 100)) <> add_fifties(rem(number, 100), string)
  end

  def add_hundreds(number, string) when number in 90..99 do
    string <> "XC" <> add_fives(rem(number, 90), string)
  end

  def add_hundreds(number, string), do: add_fifties(number, string)

  @spec add_fifties(pos_integer, String.t()) :: String.t()
  def add_fifties(number, string) when number in 50..89 do
    string <> "L" <> add_tens(rem(number, 50), string)
  end

  def add_fifties(number, string) when number in 40..49 do
    string <> "XL" <> add_fives(rem(number, 10), string)
  end

  def add_fifties(number, string), do: add_tens(number, string)

  @spec add_tens(pos_integer, String.t()) :: String.t()
  def add_tens(number, string) when number in 10..39 do
    string <> String.duplicate("X", div(number, 10)) <> add_tens(rem(number, 10), string)
  end

  def add_tens(number, string) when number in 9..9, do: string <> "IX"
  def add_tens(number, string), do: add_fives(number, string)

  @spec add_fives(pos_integer, String.t()) :: String.t()
  def add_fives(number, string) when number in 5..8 do
    string <> "V" <> add_ones(rem(number, 5), string)
  end

  def add_fives(number, string) when number in 4..4, do: string <> "IV"
  def add_fives(number, string), do: add_ones(number, string)

  @spec add_ones(pos_integer, String.t()) :: String.t()
  def add_ones(number, string) when number in 1..3 do
    string <> String.duplicate("I", number)
  end

  def add_ones(_number, string), do: string
end
