defmodule Stats.Errors do
  def invalid_type_error() do
    {:error, "Invalid data type"}
  end
end
