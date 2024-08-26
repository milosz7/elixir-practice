defmodule ExampleProject.Recursion.ReverseNum do
  def reverse(num, acc \\ 0)
  def reverse(0, acc), do: acc
  def reverse(num, acc) do
    reverse(div(num, 10), acc * 10 + rem(num, 10))
  end
end
