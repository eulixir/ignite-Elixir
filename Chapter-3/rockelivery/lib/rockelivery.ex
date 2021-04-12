defmodule Rockelivery do
  alias Rockelivery.Users.Create, as: UserCreate
  alias Rockelivery.Users.Get, as: UserGet

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(params), to: UserGet, as: :by_id
end

# params = %{
#   address: "Rua das bananeiras",
#   age: 27,
#   cep: "73030038",
#   cpf: "12345678901",
#   email: "Joao@banana",
#   name: "jp",
#   password: "12345678900"
#  }
