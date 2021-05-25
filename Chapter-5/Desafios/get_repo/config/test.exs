use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :get_repo, GetRepo.Repo,
  username: "postgres",
  password: "@dmin",
  database: "get_repo_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :get_repo, GetRepoWeb.GetRepoController, get_repo_adapter: GetRepo.Client.UserRepoMock

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :get_repo, GetRepoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
