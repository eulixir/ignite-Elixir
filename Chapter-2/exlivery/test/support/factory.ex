defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
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

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua das pencas, casa 1",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: "2",
          unity_price: Decimal.new("20.50")
      )
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "112250055"
    }
  end
end
