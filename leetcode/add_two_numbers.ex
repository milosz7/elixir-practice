defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule Solution do
  @doc """
  https://leetcode.com/problems/add-two-numbers/
  """
  @spec add_two_numbers(l1 :: ListNode.t() | nil, l2 :: ListNode.t() | nil) :: ListNode.t() | nil
  def add_two_numbers(l1, l2) do
    add_two_numbers(l1, l2, 0, nil)
    |> inverse_list()
  end

  defp add_two_numbers(nil, nil, 0, acc), do: acc

  defp add_two_numbers(nil, nil, rem, acc) do
    add_two_numbers(nil, nil, 0, %ListNode{val: rem, next: acc})
  end

  defp add_two_numbers(nil, l, rem, acc) do
    sum = l.val + rem
    new_rem = div(sum, 10)
    val = rem(sum, 10)
    add_two_numbers(nil, l.next, new_rem, %ListNode{val: val, next: acc})
  end

  defp add_two_numbers(l, nil, rem, acc) do
    add_two_numbers(nil, l, rem, acc)
  end

  defp add_two_numbers(l1, l2, rem, acc) do
    sum = l1.val + l2.val + rem
    new_rem = div(sum, 10)
    val = rem(sum, 10)
    add_two_numbers(l1.next, l2.next, new_rem, %ListNode{val: val, next: acc})
  end

  defp inverse_list(nil, acc), do: acc

  defp inverse_list(l, acc) do
    inverse_list(l.next, %ListNode{val: l.val, next: acc})
  end

  defp inverse_list(l) do
    inverse_list(l.next, %ListNode{val: l.val, next: nil})
  end
end
