defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna), do: Enum.flat_map(dna, &transcribe_nucleotide/1)

  @spec transcribe_nucleotide(char) :: char
  defp transcribe_nucleotide(?G), do: 'C'
  defp transcribe_nucleotide(?C), do: 'G'
  defp transcribe_nucleotide(?T), do: 'A'
  defp transcribe_nucleotide(?A), do: 'U'
end
