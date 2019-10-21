defmodule RotationalCipher do
  @letters "abcdefghijklmnopqrstuvwxyz"
  @numbers 1..26

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.codepoints()
    |> Enum.map(&(letter_to_number(&1) + shift))
    |> Enum.map(&number_to_letter/1)
    |> Enum.join()
  end

  defp letter_to_number(letter) do
    @letters
    |> String.codepoints()
    |> Enum.zip(@numbers)
    |> Enum.into(%{})
    |> Map.get(letter)
  end

  defp number_to_letter(number) do
    @numbers
    |> Enum.zip(String.codepoints(@letters))
    |> Enum.into(%{})
    |> Map.get(number)
  end
end
