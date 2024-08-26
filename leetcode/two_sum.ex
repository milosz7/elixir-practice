defmodule TwoSum do
  @doc """
  https://leetcode.com/problems/two-sum/
  """
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    nums
    |> Enum.with_index()
    |> two_sum(target, %{})
  end

  defp two_sum([current | rest], target, seen) do
    {num, cur_idx} = current
    diff = target - num

    case seen do
      %{^diff => diff_idx} -> [cur_idx, diff_idx]
      _ -> two_sum(rest, target, Map.put(seen, num, cur_idx))
    end
  end
end
