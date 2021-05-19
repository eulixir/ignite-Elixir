defmodule Exmeal.MealTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Ecto.Changeset

  alias Exmeal.Meal

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      user_params = build(:users_params)

      {_ok, user} = Exmeal.create_user(user_params)
      user_id = user.id

      params = %{description: "Batata", date: "2001-05-02", calories: "20", user_id: user_id}

      response = Meal.changeset(params)

      assert %Changeset{
               changes: %{
                 description: "Batata",
                 date: ~D[2001-05-02],
                 calories: 20,
                 user_id: _user_id
               },
               valid?: true
             } = response
    end
  end
end
