defmodule Exmeal.Meals.UpdateTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  describe "Update Meal" do
    test "when a valid id is given, returns the meal" do
      user_params = build(:users_params)

      {_ok, user} = Exmeal.create_user(user_params)

      params = build(:meals_params, %{user_id: user.id})

      {_ok, meal} = Exmeal.create_meal(params)

      response = Exmeal.update_meal(%{"id" => meal.id, "calories" => 25})

      assert {:ok,
              %Exmeal.Meal{
                calories: 25,
                date: ~D[2001-05-02],
                description: "Banana",
                id: _id,
                user_id: _user_id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.update_meal(%{"id" => id})

      assert {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}} = response
    end
  end
end
