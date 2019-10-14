defmodule ListOps do
  @spec count(list()) :: non_neg_integer()
  def count([_head | tail]), do: 1 + count(tail)
  def count([]), do: 0

  @spec reverse(list()) :: list()
  def reverse([head | tail]), do: reverse(tail) ++ [head]
  def reverse([]), do: []

  @spec map(list(), (any() -> any())) :: list()
  def map([head | tail], f), do: [f.(head) | map(tail, f)]
  def map([], _f), do: []

  @spec filter(list(), (any() -> as_boolean(term))) :: list()
  def filter([head | tail], f) do
    if(f.(head), do: [head | filter(tail, f)], else: filter(tail, f))
  end

  def filter([], _f), do: []

  @type acc :: any()
  @spec reduce(list(), acc(), (any(), acc() -> acc())) :: acc()
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)
  def reduce([], acc, _f), do: acc

  @spec append(list(), list()) :: list()
  def append(a, b) do
    a ++ b
  end

  @spec concat([[any()]]) :: [any()]
  def concat([head | tail]), do: head ++ concat(tail)
  def concat([]), do: []
end
