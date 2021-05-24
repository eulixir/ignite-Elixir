defmodule GetRepo.Client.Behaviour do
  alias GetRepo.Error
  @callback get_user_repos(String.t()) :: {:ok, map} | {:error, Error.t()}
end
