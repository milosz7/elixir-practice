defmodule ExampleProject.Recursion.Factorial do
  def of(0), do: 1
  def of(num), do: num * of(num - 1)

  def of_tail(num, acc \\ 1)
  def of_tail(0, acc), do: acc
  def of_tail(num, acc), do: of_tail(num - 1, acc * num)
end
