defmodule GetRepoWeb.UsersView do
  use GetRepoWeb, :view

  alias GetRepo.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: %{
        user: user
      }
    }
  end
end
