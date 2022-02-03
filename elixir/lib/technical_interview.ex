defmodule TechnicalInterview do
  @moduledoc """
  Add the functions described below to this module. Do not use the Elixir core libraries in your implementation.

  `count(list)`: Returns the size of the list.
  `all?(list)`: Returns true if all elements in list are truthy.
  `any?(list)`: Returns true if at least one element in list is truthy.

  """

  def reverse(list, acc \\ [])
  def reverse([], acc), do: acc

  def reverse([h | t], acc) do
    reverse(t, [h | acc])
  end

  def map(list, fun, acc \\ [])
  def map([], _, acc), do: reverse(acc)

  def map([head | tail], fun, acc) do
    map(tail, fun, [fun.(head) | acc])
  end

  def reduce([], acc, _), do: acc

  def reduce([head | tail], acc, fun) do
    reduce(tail, fun.(head, acc), fun)
  end
end
