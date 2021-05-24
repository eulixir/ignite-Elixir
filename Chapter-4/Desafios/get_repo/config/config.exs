# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :get_repo,
  ecto_repos: [GetRepo.Repo]

config :get_repo, GetRepoWeb.GetRepoController, get_repo_adapter: GetRepo.Client.UserRepo

# Configures the endpoint
config :get_repo, GetRepoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MPiy9jE1f2maGKVQ7rVKCW9FknZvB3rHqE0Qvwt3WF1DGAXV/uUdaUP+0FaelxT7",
  render_errors: [view: GetRepoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GetRepo.PubSub,
  live_view: [signing_salt: "u6B5T6vT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
