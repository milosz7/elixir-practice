defmodule ExampleProject.Structs.Expense do
  defstruct(
    title: "",
    date: nil,
    amount: 0,
    store: ""
  )

  alias ExampleProject.Structs.Expense

  @type t :: %Expense{
          title: String.t(),
          date: Date.t() | nil,
          amount: number(),
          store: String.t()
        }

  @spec sample() :: [t()]
  def sample() do
    [
      %Expense{title: "Groceries", date: ~D[2022-09-12], amount: 18.99, store: "Metro"},
      %Expense{title: "Mobile", date: ~D[2022-10-18], amount: 55.65, store: "Bell"},
      %Expense{title: "Jacket", date: ~D[2022-07-06], amount: 150.99, store: "Marks"},
      %Expense{title: "Air Jordans", date: ~D[2022-10-01], amount: 799.99, store: "Nike"}
    ]
  end

  @spec total_spent([t()]) :: number()
  def total_spent(expenses) do
    expenses
    |> Enum.reduce(0, fn %{amount: amt}, acc -> amt + acc end)
  end

  @spec sort_by_date([t()]) :: [t()]
  def sort_by_date(expenses) do
    expenses
    # |> Enum.sort(&Date.after?(&2.date, &1.date))
    |> Enum.sort_by(& &1.date, Date)
  end

  @spec add_expense(t()) :: [t()]
  def add_expense(%Expense{} = expense) do
    [expense | sample()]
  end

  @spec update_amount(String.t(), number()) :: [t()]
  def update_amount(title, amount) do
    expenses = sample()

    to_update =
      expenses
      |> Enum.find(fn %{title: title_} -> title_ === title end)

    updated = %{to_update | amount: amount}
    [updated | expenses |> List.delete(to_update)]
  end

  @users ["Mike", "Ann", "Joe", "John"]

  def authenticate(user) when user in @users, do: {:ok, "Authenticated"}
  def authenticate(_user), do: {:error, "Unauthorized"}

  def verify_password(user, _password) when user in @users, do: {:ok, "Correct password"}
  def verify_password(_user, _password), do: {:error, "Incorrect login credentials"}

  def login(user, password) do
    with {:ok, _message} <- authenticate(user),
         {:ok, _} <- verify_password(user, password) do
      {:ok, "#{user} logged in succesfully"}
    else
      {:error, msg} -> {:error, msg}
      _ -> :unauthorized
    end
  end
end
