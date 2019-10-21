defmodule ListOps do
  @spec count(list()) :: non_neg_integer()
  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)

  @spec reverse(list()) :: list()
  def reverse(list), do: reverse(list, [])
  defp reverse([], acc), do: acc
  defp reverse([head | tail], acc), do: reverse(tail, [head | acc])

  @spec map(list(), (any() -> any())) :: list()
  def map([], _f), do: []
  def map([head | tail], f), do: [f.(head) | map(tail, f)]

  @spec filter(list(), (any() -> as_boolean(term))) :: list()
  def filter([], _f), do: []

  def filter([head | tail], f) do
    if f.(head), do: [head | filter(tail, f)], else: filter(tail, f)
  end

  @type acc :: any()
  @spec reduce(list(), acc(), (any(), acc() -> acc())) :: acc()
  def reduce([], acc, _f), do: acc
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list(), list()) :: list()
  def append([], []), do: []
  def append(a, []), do: a
  def append([], b), do: b
  def append([head | tail], b), do: [head | append(tail, b)]

  @spec concat([[any()]]) :: [any()]
  def concat([]), do: []
  def concat([head | tail]), do: append(head, concat(tail))
end
