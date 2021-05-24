defmodule GetRepo.Client.Parser do
  @keys [:id, :name, :description, :html_url, :stargazers_count]

  @enforce_keys @keys

  @derive {Jason.Encoder, only: @keys}

  defstruct @keys

  def build([_head | _tail] = body) do
    Enum.map(body, fn content -> build_repositories(content) end)
  end

  defp build_repositories(content) do
    %__MODULE__{
      id: content["id"],
      name: content["name"],
      description: content["description"],
      html_url: content["html_url"],
      stargazers_count: content["stargazers_count"]
    }
  end
end
