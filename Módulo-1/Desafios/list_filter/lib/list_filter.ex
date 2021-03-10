defmodule ListFilter do

  def filter(list) do
    list
    |> Enum.map(fn(x) -> "#{x}" end)
    |> Enum.flat_map( fn string ->
      case Integer.parse(string) do
        {int, _rest} ->
          [int]
          Enum.filter([int], fn x -> rem(x, 2) == 1 end)
        :error ->
          []
      end
    end)
  end
end
