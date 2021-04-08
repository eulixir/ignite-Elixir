defmodule RockeliveryWeb.WelcomeController do
  use RockeliveryWeb, :controller

   def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> IO.inspect()
    |> text("Welcome :)")
   end
end
