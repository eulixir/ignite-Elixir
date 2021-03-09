defmodule ListFilter do

  def filter() do
    list = ["1", "3", "6", "43", "banana", "6", "abc"]

    Enum.flat_map(list, fn string ->
      case Integer.parse(string) do
        # transform to integer
        {int, _rest} ->
          [int]

          Enum.filter([int], fn x -> rem(x, 2) == 1 end)

        :error ->
          []
      end
    end)
  end
end
