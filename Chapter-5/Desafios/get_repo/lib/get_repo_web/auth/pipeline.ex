defmodule GetRepoWeb.Auth.Pipeline do
    use Guardian.Plug.Pipeline, otp_app: :get_repo

    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource
end
