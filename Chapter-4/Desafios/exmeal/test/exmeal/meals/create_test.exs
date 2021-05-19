defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      user_params = build(:users_params)

      {_ok, user} = Exmeal.create_user(user_params)

      params = build(:meals_params, %{user_id: user.id})
      response = Exmeal.create_meal(params)

      assert {:ok,
              %Exmeal.Meal{
                calories: 20,
                date: ~D[2001-05-02],
                description: "Banana",
                id: _id,
                user_id: _user_id
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        calories: 20,
        date: ~D[2001-05-02]
      }

      response = Exmeal.create_meal(params)

      assert {:error, %Exmeal.Error{}} = response
    end
  end
end
