defmodule GetRepo.Factory do
  use ExMachina.Ecto, repo: Repo.Repo

  alias GetRepo.Client.Parser
  alias GetRepo.User

  def repo_info_factory do
    %Parser{
      description: "Projeto desenvolvido durante a Next Level Week, feito pela @Rocketseat com 💜",
      html_url: "https://github.com/joaopealves/inmana",
      id: 359_424_756,
      name: "inmana",
      stargazers_count: 8
    }
  end

  def user_repos_body_factory(_attrs) do
    ~s(
      [
        {
          "id": 359424756,
          "name": "inmana",
          "description": "Projeto desenvolvido durante a Next Level Week, feito pela @Rocketseat com 💜",
          "html_url": "https://github.com/joaopealves/inmana",
          "stargazers_count": 8
        }
      ]
    )
  end

  def user_factory(_bananas) do
    %User{password: "banana", id: "69961117-d966-4e2f-ac55-476d4f78ddfa"}
  end
end
