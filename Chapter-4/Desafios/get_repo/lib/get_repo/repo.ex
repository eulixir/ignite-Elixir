defmodule GetRepo.Repo do
  use Ecto.Repo,
    otp_app: :get_repo,
    adapter: Ecto.Adapters.Postgres
end
