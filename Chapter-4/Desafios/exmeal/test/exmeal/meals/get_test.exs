defmodule Exmeal.Meals.GetTest do
  use Exmeal.DataCase

  alias Exmeal.Meals.{Create, Get}

  describe "Get Meal" do
    test "when id is valid, returns the meal" do
      params = %{
        calories: 20,
        date: ~D[2001-05-02],
        description: "Banana"
      }

      {_ok, meal} = Create.call(params)

      response = Get.by_id(meal.id)

      assert {:ok,
              %Exmeal.Meal{
                calories: 20,
                date: ~D[2001-05-02],
                description: "Banana",
                id: _id
              }} = response
    end

    test "when id is invalid, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Get.by_id(id)

      assert {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}} = response
    end
  end
end
