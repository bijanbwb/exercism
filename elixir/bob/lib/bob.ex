defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    with(normalized_input <- String.trim(input)) do
      cond do
        silence(normalized_input) ->
          "Fine. Be that way!"

        asking(normalized_input) and shouting(normalized_input) ->
          "Calm down, I know what I'm doing!"

        asking(normalized_input) ->
          "Sure."

        shouting(normalized_input) ->
          "Whoa, chill out!"

        true ->
          "Whatever."
      end
    end
  end

  @spec asking(String.t()) :: boolean()
  defp asking(input), do: String.ends_with?(input, "?")

  @spec shouting(String.t()) :: boolean()
  defp shouting(input),
    do: String.upcase(input) == input and String.match?(input, ~r/[[:alpha:]]/)

  @spec silence(String.t()) :: boolean()
  defp silence(input), do: String.equivalent?(input, "")
end
