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
  def numeral(number) do
    add_thousands(number, "")
  end

  # 1000s (M)

  @spec add_thousands(pos_integer, String.t()) :: String.t()
  def add_thousands(number, string) when number in 1000..@maximum_input do
    thousands = div(number, 1000)
    remainder = rem(number, 1000)
    string <> String.duplicate("M", thousands) <> add_five_hundreds(remainder, string)
  end

  def add_thousands(number, string) when number in 900..999 do
    remainder = rem(number, 900)
    string <> "CM" <> add_five_hundreds(remainder, string)
  end

  def add_thousands(number, string) do
    add_five_hundreds(number, string)
  end

  # 500s (D)
  @spec add_five_hundreds(pos_integer, String.t()) :: String.t()
  def add_five_hundreds(number, string) when number in 500..899 do
    remainder = rem(number, 500)
    string <> "D" <> add_hundreds(remainder, string)
  end

  def add_five_hundreds(number, string) when number in 400..499 do
    remainder = rem(number, 400)
    string <> "CD" <> add_hundreds(remainder, string)
  end

  def add_five_hundreds(number, string) do
    add_hundreds(number, string)
  end

  # 100s (C)

  @spec add_hundreds(pos_integer, String.t()) :: String.t()
  def add_hundreds(number, string) when number in 100..399 do
    hundreds = div(number, 100)
    remainder = rem(number, 100)
    string <> String.duplicate("C", hundreds) <> add_fifties(remainder, string)
  end

  def add_hundreds(number, string) when number in 90..99 do
    remainder = rem(number, 90)
    string <> "XC" <> add_fifties(remainder, string)
  end

  def add_hundreds(number, string) do
    add_fifties(number, string)
  end

  # 50s (L)

  @spec add_fifties(pos_integer, String.t()) :: String.t()
  def add_fifties(number, string) when number in 50..89 do
    remainder = rem(number, 50)
    string <> "L" <> add_tens(remainder, string)
  end

  def add_fifties(number, string) when number in 40..49 do
    remainder = rem(number, 40)
    string <> "XL" <> add_tens(remainder, string)
  end

  def add_fifties(number, string) do
    add_tens(number, string)
  end

  # 100s (X)

  @spec add_tens(pos_integer, String.t()) :: String.t()
  def add_tens(number, string) when number in 10..39 do
    tens = div(number, 10)
    remainder = rem(number, 10)
    string <> String.duplicate("X", tens) <> add_tens(remainder, string)
  end

  def add_tens(number, string) when number in 9..9 do
    string <> "IX" <> add_fives(number, string)
  end

  def add_tens(number, string) do
    add_fives(number, string)
  end

  # 5s (V)

  @spec add_fives(pos_integer, String.t()) :: String.t()
  def add_fives(number, string) when number in 5..8 do
    remainder = rem(number, 5)
    string <> "V" <> add_ones(remainder, string)
  end

  def add_fives(number, string) when number in 4..4 do
    string <> "IV" <> add_ones(number, string)
  end

  def add_fives(number, string) do
    add_ones(number, string)
  end

  # 1s (I)

  @spec add_ones(pos_integer, String.t()) :: String.t()
  def add_ones(number, string) when number in 1..3 do
    string <> String.duplicate("I", number)
  end

  def add_ones(_number, string) do
    string
  end
end
