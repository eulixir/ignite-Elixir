defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 27,
      address: "Rua das bananeiras, 15",
      cep: "12345678",
      cpf: "12345678900",
      email: "jp@banana.com",
      password: "123456",
      name: "Jp"
    }
  end

  def user_factory do
    %User{
      age: 27,
      address: "Rua das bananeiras, 15",
      cep: "12345678",
      cpf: "12345678900",
      email: "jp@banana.com",
      password: "123456",
      name: "Jp",
      id: "69961117-d966-4e2f-ac55-476d4f78ddfa"
    }
  end
end
