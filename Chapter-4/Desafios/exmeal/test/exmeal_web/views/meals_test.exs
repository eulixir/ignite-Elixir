defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Phoenix.View

  import Exmeal.Factory

  alias Exmeal.Meal

  alias ExmealWeb.MealsView

  test "render create.json" do
    user_params = build(:users_params)

    {_ok, user} = Exmeal.create_user(user_params)
    user_id = user.id

    params = %{description: "Banana", date: "2001-05-02", calories: "20", user_id: user_id}
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %{
               meal: %Meal{
                 calories: 20,
                 date: ~D[2001-05-02],
                 description: "Banana",
                 id: _id,
                 user_id: _user_id
               }
             },
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    user_params = build(:users_params)

    {_ok, user} = Exmeal.create_user(user_params)
    user_id = user.id

    params = %{description: "Banana", date: "2001-05-02", calories: "20", user_id: user_id}
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 20,
               date: ~D[2001-05-02],
               description: "Banana",
               id: _id,
               user_id: _user_id
             }
           } = response
  end
end
