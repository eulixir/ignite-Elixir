defmodule GetRepoWeb.UsersController do
  use GetRepoWeb, :controller

  alias GetRepo.{User, Users.Create}
  alias GetRepoWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
