defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Phoenix.View

  alias ExmealWeb.MealsView

  alias Exmeal.Meals.Create

  test "render create.json" do

    meal = Create.call(%{description: "Banana", date: "2001-05-02", calories: "20"})

    response = render(MealsView, "create.json", meal: meal)

    assert "banana" == response

  end
end
