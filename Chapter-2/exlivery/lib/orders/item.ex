defmodule Exlivery.Orders.Item do

  @categories [:pizza, :hambuerguer, :prato_feito, :japonesa, :sobrenmsa]
  @keys [:description, :category, :unity_price, :quantity]

  @enforce_keys @keys

  defstruct @keys

  def build(description, category, unity_price, quantity)
       when quantity > 0 and category in @categories do
        {:ok, %__MODULE__{
          description: description,
          category: category,
          quantity: quantity,
          unity_price: unity_price
        }}
  end
end
