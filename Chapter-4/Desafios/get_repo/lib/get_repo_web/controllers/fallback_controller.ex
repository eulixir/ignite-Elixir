defmodule GetRepoWeb.FallbackController do
  use GetRepoWeb, :controller

  alias GetRepoWeb.ErrorView
  alias GetRepo.Error

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
