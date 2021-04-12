defmodule RockeliveryWeb.FallbackController do
  use RockeliveryWeb, :controller

  alias RockeliveryWeb.ErrorView

  def call(conn, {:error, result}) do
    conn
    |> put_status(401)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end

end
