defmodule ExampleProject.Structs.SevenWonders do
  defstruct name: "", country: ""
  alias ExampleProject.Structs.SevenWonders

  @type t :: %SevenWonders{
          name: String.t(),
          country: String.t()
        }

  @spec all() :: [t()]
  def all() do
    [
      %SevenWonders{name: "Taj Mahal", country: "India"},
      %SevenWonders{name: "Chichén Itzá", country: "Mexico"},
      %SevenWonders{name: "Petra", country: "Jordan"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Christ the Redeemer", country: "Brazil"},
      %SevenWonders{name: "Colosseum", country: "Italy"},
      %SevenWonders{name: "The Great Wall of China", country: "China"}
    ]
  end

  @spec print_names([t()]) :: :ok
  def print_names(wonders) do
    wonders
    |> Enum.each(fn %{name: name} -> IO.puts(name) end)
  end

  @spec filter_by_country([t()], String.t()) :: [t()]
  def filter_by_country(wonders, country) do
    wonders
    |> Enum.filter(fn %{country: country_} -> country_ === country end)
  end

  @spec countries_start_with_i([t()]) :: [t()]
  def countries_start_with_i(wonders) do
    wonders
    # |> Enum.filter(fn %{country: country} -> String.first(country) === "I" end)
    |> Enum.filter(fn %{country: country} -> String.starts_with?(country, "I") end)
  end

  @spec sort_by_country_length([t()]) :: [t()]
  def sort_by_country_length(wonders) do
    # capture operator + reference to 1st and 2nd arg
    wonders
    |> Enum.sort(&(String.length(&1.country) <= String.length(&2.country)))
  end

  @spec name_country_list([t()]) :: [[String.t()]]
  def name_country_list(wonders) do
    wonders
    # |> Enum.map(fn %{name: name, country: country} -> [name, country] end)
    |> Enum.reduce([], fn %{name: name, country: country}, acc -> [[name, country] | acc] end)
  end

  @spec country_name_kw_list([t()]) :: [{atom(), String.t()}]
  def country_name_kw_list(wonders) do
    wonders
    # |> Enum.reduce([], fn %{name: name, country: country}, acc -> [{String.to_atom(country), name} | acc] end)
    |> Enum.flat_map(fn %{name: name, country: country} -> [{String.to_atom(country), name}] end)
  end

  @spec all_names([t()]) :: [String.t()]
  def all_names(wonders) do
    # wonders
    # |> Enum.map(& &1.name)
    for %{name: name} <- wonders, do: name
  end
end
