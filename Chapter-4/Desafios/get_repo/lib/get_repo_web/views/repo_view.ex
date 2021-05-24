defmodule GetRepoWeb.GetRepoView do
  use GetRepoWeb, :view

  alias GetRepo.Client.Parser

  def render("repos.json", %{user_repos: [%Parser{} | _tail] = user_repos}) do
    %{
      user_repos: user_repos
    }
  end
end
