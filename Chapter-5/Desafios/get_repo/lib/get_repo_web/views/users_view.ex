defmodule GetRepoWeb.UsersView do
  use GetRepoWeb, :view

  alias GetRepo.User

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created!",
      user: %{
        user: user,
      },
      token: token
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: %{user: user}}

  def render("sign_in.json", %{token: token}), do: %{token: token}
end
