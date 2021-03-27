defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def users_factory do
    %User{
      name: "Jp",
      address: "Rua das pencas, casa 1",
      email: "jp@banana.com",
      cpf: "112250055",
      age: 19
    }
  end
end
