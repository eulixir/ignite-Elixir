defmodule Exmeal.Users.Get do

  alias Exmeal.{Error, Repo, User}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, Repo.preload(user, [:meals])}
    end
  end
end
