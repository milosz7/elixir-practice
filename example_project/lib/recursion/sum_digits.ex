defmodule ExampleProject.Recursion.SumDigits do
  def sum_to(0), do: 0
  def sum_to(num) do
    sum_tail_recursive(num)
  end

  # function header
  def sum_tail_recursive(num, acc \\ 0)
  def sum_tail_recursive(0, acc), do: acc
  def sum_tail_recursive(num, acc) do
    sum_tail_recursive(num - 1, acc + num)
  end
end
