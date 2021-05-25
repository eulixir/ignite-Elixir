defmodule GetRepo.Users.Get do
  alias GetRepo.{Error, Repo, User}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      _user -> {:ok, Repo.get(User, id)}
    end
  end
end
