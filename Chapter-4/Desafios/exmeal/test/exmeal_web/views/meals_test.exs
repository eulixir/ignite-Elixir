defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Phoenix.View

  alias ExmealWeb.MealsView

  alias Exmeal.Meals.Create

  test "render create.json" do
    params = %{description: "Banana", date: "2001-05-02", calories: "20"}
    {_ok, meal} = Create.call(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %{
               meal: %Exmeal.Meal{
                 calories: 20,
                 date: ~D[2001-05-02],
                 description: "Banana",
                 id: _id
               }
             },
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    params = %{description: "Banana", date: "2001-05-02", calories: "20"}
    {_ok, meal} = Create.call(params)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Exmeal.Meal{
               calories: 20,
               date: ~D[2001-05-02],
               description: "Banana",
               id: _id
             }
           } = response
  end
end
