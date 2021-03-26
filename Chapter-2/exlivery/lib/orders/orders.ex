defmodule Exlivery.Orders.Order do
  @keys [:users_cpf, :delivery_adress, :items, :total_price]

  @enforce_keys @keys

  defstruct @keys

  def build do
    {:ok, %__MODULE__{users_cpf: nil, delivery_adress: nil, items: nil, total_price: nil}}
  end
end
