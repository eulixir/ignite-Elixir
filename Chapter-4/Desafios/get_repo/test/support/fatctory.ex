defmodule GetRepo.Factory do
  use ExMachina.Ecto, repo: Repo.Repo

  alias GetRepo.Client.Parser

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
        },
      ]
    )
  end
end
