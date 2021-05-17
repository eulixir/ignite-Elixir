defmodule Rockelivery.ViaCep.Cliend do
  use Tesla

  plug Tesla.Middleware.JSON

  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws/"

  # def get_cep_info(ceo) do
  # "#{cep}/json/"
  # |> get()
  # |> handle_get()
  # end

  # defp handle_get({:ok, %Env{status: 200, body: %{"erro" => true}}}) do

  # end
end
