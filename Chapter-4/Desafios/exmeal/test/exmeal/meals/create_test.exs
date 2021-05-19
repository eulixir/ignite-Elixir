defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      user_params = %{
        name: "Jp",
        email: "Jp@banana.com",
        cpf: "12345678900"
      }

      {_ok, user} = Exmeal.create_user(user_params)
      user_id = user.id

      params = %{
        calories: 20,
        date: ~D[2001-05-02],
        description: "Banana",
        user_id: user_id
      }

      response = Exmeal.create_meal(params)

      assert {:ok,
              %Exmeal.Meal{
                calories: 20,
                date: ~D[2001-05-02],
                description: "Banana",
                id: _id,
                user_id: user_id
              }} = response
    end
    test "when there are invalid params, returns an error" do
      params = %{
        calories: 20,
        date: ~D[2001-05-02],
      }

      response = Exmeal.create_meal(params)

      assert {:error, %Exmeal.Error{}} = response
    end
  end
end
