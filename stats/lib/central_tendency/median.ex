defmodule Stats.CentralTendency.Median do
  require Integer
  alias Stats.{Errors, Validate}

  @spec population_median([number()]) :: number() | {atom(), String.t()}
  def population_median([]), do: Errors.invalid_type_error()

  def population_median(nums) when is_list(nums) do
    nums
    |> Validate.is_number_list?()
    |> calculate_population_median()
  end

  def population_median(_), do: Errors.invalid_type_error()

  defp calculate_population_median({true, nums}) do
    count = Enum.count(nums)

    nums
    |> Enum.sort()
    |> get_median(Integer.is_odd(count), count)
  end

  defp calculate_population_median({false, _}), do: Errors.invalid_type_error()

  defp get_median(nums, true, count), do: Enum.at(nums, div(count, 2))

  defp get_median(nums, false, count) do
    [a, b] =
      nums
      |> Enum.slice(div(count, 2) - 1, 2)

    (a + b) / 2
  end
end
