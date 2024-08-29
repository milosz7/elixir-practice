defmodule LongestSubstring do
  @doc """
  https://leetcode.com/problems/longest-substring-without-repeating-characters/
  """
  @spec length_of_longest_substring(s :: String.t()) :: integer
  def length_of_longest_substring(s) do
    s
    |> String.graphemes()
    |> length_of_longest_substring(0, 0, 0, %{})
  end

  defp length_of_longest_substring([current | rest], start, end_, longest, seen) do
    idx = Map.get(seen, current, -1)
    start = max(start, idx + 1)
    longest = max(end_ - start + 1, longest)
    length_of_longest_substring(rest, start, end_ + 1, longest, Map.put(seen, current, end_))
  end

  defp length_of_longest_substring([], _, _, longest, _), do: longest
end
