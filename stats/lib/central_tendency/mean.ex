defmodule Stats.CentralTendency.Mean do
  alias Stats.{Errors, Validate}

  @spec population_mean([number()]) :: number() | {atom(), String.t()}
  def population_mean([]), do: Errors.invalid_type_error()

  def population_mean(nums) when is_list(nums) do
    nums
    |> Validate.is_number_list?()
    |> calculate_population_mean()
  end

  def population_mean(_), do: Errors.invalid_type_error()

  @spec sample_mean([number()]) :: number() | {atom(), String.t()}
  def sample_mean(nums), do: population_mean(nums)

  defp calculate_population_mean({true, nums}) do
    Enum.sum(nums) / length(nums)
  end

  defp calculate_population_mean({false, _}), do: Errors.invalid_type_error()
end
