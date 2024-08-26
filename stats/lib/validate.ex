defmodule Stats.Validate do
  alias Stats.Errors

  @spec is_number_list?([any()]) :: {true, [number()]} | {false, [any()]} | {atom(), String.t()}
  def is_number_list?(nums) when is_list(nums) do
    {Enum.all?(nums, fn x -> is_number(x) end), nums}
  end

  def is_number_list?(_), do: Errors.invalid_type_error()
end
