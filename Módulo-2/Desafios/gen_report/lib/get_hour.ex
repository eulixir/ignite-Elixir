defmodule GenReport.GetHours do
  def get_hours([id, hours, _day, month, year], %{
        "all_hours" => all_hours,
        "hours_per_month" => hours_per_month,
        "hours_per_year" => hours_per_year
      }) do
    all_hours = Map.put(all_hours, id, all_hours[id] + hours)
    hours_per_month = sum_values(hours_per_month, id, month, hours)
    hours_per_year = sum_values(hours_per_year, id, year, hours)

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  defp sum_values(map, id, date, hours),
    do: put_in(map[id], Map.put(map[id], date, map[id][date] + hours))
end
