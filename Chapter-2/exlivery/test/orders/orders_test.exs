defmodule ExUnit.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid, returns an order" do
      users = build(:users)

      items = [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: "2",
          unity_price: Decimal.new("20.50")
        )
      ]

      response = Order.build(users, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end
  end

  test "when there is not items in order, returns an error" do
    users = build(:users)

    items = []

    response = Order.build(users, items)

    expected_response = {:error, "Invalid paramters"}

    assert response == expected_response
  end
end
