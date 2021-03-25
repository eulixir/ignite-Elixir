defmodule ListLenght do
  def list_length(list), do: do_list_length(list, 0)

  defp do_list_length([_head | tail], acc) do
    do_list_length(tail, acc + 1)
  end

  defp do_list_length([], acc), do: acc
end
