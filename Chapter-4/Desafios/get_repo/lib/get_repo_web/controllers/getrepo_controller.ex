defmodule GetRepoWeb.GetRepoController do
  use GetRepoWeb, :controller

  alias GetRepo.Client.{UserRepo, Parser}

  action_fallback FallbackController

  def show(conn, %{"username" => username}) do
    with {:ok, [%Parser{} | _tail] = user_repos} <- UserRepo.get_user_repos(username) do
      conn
      |> put_status(:ok)
      |> render("repos.json", user_repos: user_repos)
    end
  end
end
