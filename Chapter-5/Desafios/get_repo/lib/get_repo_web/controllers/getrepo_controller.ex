defmodule GetRepoWeb.GetRepoController do
  use GetRepoWeb, :controller

  alias GetRepo.Client.Parser

  alias GetRepoWeb.FallbackController

  action_fallback FallbackController

  def show(conn, %{"username" => username}) do
    with {:ok, [%Parser{} | _tail] = user_repos} <- get_github_client().get_user_repos(username) do
      conn
      |> put_status(:ok)
      |> render("repos.json", user_repos: user_repos)
    end
  end

  defp get_github_client do
    :get_repo
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:get_repo_adapter)
  end
end
