defmodule Leetcode.AddOne do
  @doc """
  https://leetcode.com/problems/plus-one/
  """
  @spec plus_one(digits :: [integer]) :: [integer]
  def plus_one(digits) do
    digits
    |> Enum.reverse()
    |> add_one()
  end

  defp add_one(digits, acc \\ [], rem \\ 1)

  defp add_one([], acc, rem) do
    case rem do
      0 -> acc
      _ -> [rem | acc]
    end
  end

  defp add_one([h | t], acc, rem) do
    add_one(t, [rem(h + rem, 10) | acc], div(h + rem, 10))
  end
end
