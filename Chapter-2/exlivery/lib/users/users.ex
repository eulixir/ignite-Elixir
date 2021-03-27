defmodule Exlivery.Users.User do
  @keys [:address, :name, :email, :cpf, :age]
  @enforce_keys @keys
  defstruct @keys

  def build(name, address, email, cpf, age) when age >= 18 and is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       name: name,
       address: address,
       email: email,
       cpf: cpf,
       age: age
     }}
  end

  def build(_address, _name, _email, _cpf, age) when age < 18, do: {:error, "Age must be over 18"}

  def build(_address, _name, _email, cpf, _age) when is_integer(cpf),
    do: {:error, "Cpf must be a String"}

  def build(_address, _name, _email, _cpf, _age), do: {:error, "Invalid Parameters"}
end
