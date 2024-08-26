defmodule ExampleProject.Lists do
  @moduledoc """
  Module for functions used to operate on lists.
  """

  @doc """
  Returns the sum of numbers in the list.
  """
  @spec sum(list(number()), integer()) :: number()
  def sum(list, acc \\ 0)
  def sum([], acc), do: acc
  def sum([h | t], acc), do: sum(t, acc + h)

  @doc """
  Returns the list with elements in reverse order.
  """
  @spec reverse([any()], [any()]) :: [any()]
  def reverse(list, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])

  @doc """
  Applies the function passed to each element in the list and returns it.
  """
  @spec map([any()], (any() -> any()), [any()]) :: [any()]
  def map(list, func, acc \\ [])
  def map([h | t], func, acc), do: map(t, func, [func.(h) | acc])
  def map([], _, acc), do: acc |> reverse()

  @doc """
  Concatenates two lists together.
  """
  @spec concat([any()], [any()]) :: [any()]
  def concat(first, second), do: _concat(first |> reverse(), second)

  defp _concat([], second), do: second
  defp _concat([h | t], second), do: _concat(t, [h | second])

  @doc """
  Concatenates list of lists together.
  """
  @spec concat([[any()]]) :: [any()]
  def concat([h1, h2 | t]), do: concat([concat(h1, h2) | t])
  def concat([h | t]), do: concat(h, t)

  @doc """
  Applies map which returns a list and flattens the result.
  """
  @spec flat_map([any()], (any() -> [any()])) :: [any()]
  def flat_map(list, func), do: map(list, func) |> concat()

  # alternative version

  @spec flat_map_alt([any()], (any() -> [any()]), [any()]) :: [any()]
  def flat_map_alt(list, func, acc \\ [])
  def flat_map_alt([h | t], func, acc), do: flat_map_alt(t, func, concat(acc, func.(h)))
  def flat_map_alt([], _, acc), do: acc

end
