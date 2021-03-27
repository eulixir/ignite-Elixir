defmodule Exlivery.Orders.Item do
  @categories [:pizza, :hamburguer, :prato_feito, :japonesa, :sobrenmsa]
  @keys [:description, :category, :unity_price, :quantity]

  @enforce_keys @keys

  defstruct @keys

  def build(description, category, unity_price, quantity)
      when quantity > 0 and category in @categories do
    unity_price
    |> Decimal.cast()
    |> build_item(description, category, quantity)
  end

  def build(_description, _category, _quantity, _unity_price) do
    {:error, "Invalid parameters"}
  end

  defp build_item({:ok, unity_price}, description, category, quantity) do
    {:ok,
     %__MODULE__{
       description: description,
       category: category,
       quantity: quantity,
       unity_price: unity_price
     }}
  end

  defp build_item(:error, _description, _category, _quantity) do
    {:error, "Invalid price"}
  end
end
