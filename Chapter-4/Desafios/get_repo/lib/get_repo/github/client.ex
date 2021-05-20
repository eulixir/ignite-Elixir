defmodule GetRepo.Github.Client do
  use Tesla

  alias Tesla.Env
  alias Repo.Error
  alias GetRepo.Github.UserRepoInfo

  @base_url "https://api.github.com"
  @request_headers [
    {"User-Agent",
     "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0"}
  ]

  plug Tesla.Middleware.Headers, @request_headers
  plug Tesla.Middleware.JSON

  def get_user_repos(url \\ @base_url, username) do
    "#{url}/users/#{username}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:error, reason}), do: {:error, Error.build(:bad_request, reason)}

  defp handle_get({:ok, %Env{status: 404, body: _body}}) do
    {:error, Error.build(:bad_request, "Github username not found")}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    {:ok, UserRepoInfo.build(body)}
  end
end
