defmodule ExampleProject.Recursion.PrintDigits do
  def upto(0), do: 0

  def upto(num) do
    upto(num - 1)
    IO.puts(num)
  end
end
