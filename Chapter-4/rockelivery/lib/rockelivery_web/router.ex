defmodule RockeliveryWeb.Router do
  use RockeliveryWeb, :router
  alias RockeliveryWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", RockeliveryWeb do
    pipe_through :api

    # get "/", WelcomeController, :index

    resources "/users", UsersController, except: [:new, :edit]

    post "/items", ItemsController, :create

    post "/orders", OrdersController, :create
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/banana", metrics: RockeliveryWeb.Telemetry
    end
  end
end
