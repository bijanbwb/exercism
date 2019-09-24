defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> normalize_text()
    |> String.split([" ", "_"])
    |> Enum.reduce(%{}, fn word, acc -> Map.update(acc, word, 1, &(&1 + 1)) end)
  end

  @spec normalize_text(String.t()) :: String.t()
  defp normalize_text(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(~r/[:!&@$%^&,]/, "")
    |> String.replace(~r/\s+/, " ")
  end
end
