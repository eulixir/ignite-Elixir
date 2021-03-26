defmodule Exlivery.Users.User do

  @keys [:name, :email, :cpf, :age]
  @enforce_keys @keys
  defstruct @keys

  def build(name, email, cpf, age)when age >= 18 and is_bitstring(cpf) do
    {:ok, %__MODULE__{
      age: age,
      cpf: cpf,
      email: email,
      name: name
    }}
  end

  def build(_name, _email, _cpf, age) when age < 18, do: {:error, "Age must be over 18"}

  def build(_name, _email, cpf, _age) when is_integer(cpf), do: {:error, "Cpf must be a String"}

  def build(_name, _email, _cpf, _age), do: {:error, "Invalid Parameters"}

end
