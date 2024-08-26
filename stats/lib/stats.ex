defmodule Stats do
  alias Stats.CentralTendency.{Mean, Median}

  defdelegate population_mean(nums), to: Mean
  defdelegate sample_mean(nums), to: Mean
  defdelegate population_median(nums), to: Median
end
