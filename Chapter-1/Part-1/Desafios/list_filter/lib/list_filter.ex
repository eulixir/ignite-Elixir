defmodule ListFilter do

    def shorten_to_date(datetime) do
      datetime
      |> String.split(",")
      |> hd
      |> select_date()
     end

     defp select_date(dateList), do: dateList
end
