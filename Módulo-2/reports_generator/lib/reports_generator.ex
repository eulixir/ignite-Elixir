defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.each(fn elem -> IO.inspect(elem) end)
  end
end
