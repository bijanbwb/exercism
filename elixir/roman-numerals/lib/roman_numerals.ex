defmodule RomanNumerals do
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
  to recursively build up a string that contains the translated roman numeral.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) when number in 1000..3000, do: "M" <> numeral(number - 1000)
  def numeral(number) when number in 900..999, do: "CM" <> numeral(number - 900)
  def numeral(number) when number in 500..899, do: "D" <> numeral(number - 500)
  def numeral(number) when number in 400..499, do: "CD" <> numeral(number - 400)
  def numeral(number) when number in 100..399, do: "C" <> numeral(number - 100)
  def numeral(number) when number in 90..99, do: "XC" <> numeral(number - 90)
  def numeral(number) when number in 50..89, do: "L" <> numeral(number - 50)
  def numeral(number) when number in 40..49, do: "XL" <> numeral(number - 40)
  def numeral(number) when number in 10..39, do: "X" <> numeral(number - 10)
  def numeral(number) when number in 9..9, do: "IX" <> numeral(number - 9)
  def numeral(number) when number in 5..8, do: "V" <> numeral(number - 5)
  def numeral(number) when number in 4..4, do: "IV" <> numeral(number - 4)
  def numeral(number) when number in 1..3, do: "I" <> numeral(number - 1)
  def numeral(_number), do: ""
end
